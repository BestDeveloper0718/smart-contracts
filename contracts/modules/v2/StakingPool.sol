// SPDX-License-Identifier: GPL-3.0-only

pragma solidity ^0.8.0;

import "@openzeppelin/contracts-v4/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts-v4/utils/math/SafeCast.sol";

contract StakingPool is ERC20 {
  using SafeCast for uint;

  struct PoolBucket {
    // slot 0
    uint64 rewardPerSecondCut;
    // amount of shares requested for unstake
    uint96 unstakeRequested;
    // amount of unstaked shares
    uint96 unstaked;

    // slot 1
    // underlying amount unstaked, stored for rate calculation
    // uint96 unstakedNXM;
  }

  struct Product {
    uint96 activeCoverAmount;
    uint16 weight;
    // todo: last processed bucket?
    uint16 lastBucket;
    // uint128 _unused;
  }

  struct ProductBucket {
    uint96 expiringCoverAmount;
    // uint160 _unused;
  }

  struct UnstakeRequest {
    uint96 amount;
    uint96 withdrawn;
    uint16 bucketIndex; // createdAtBucket
    // uint48 _unused;
  }

  struct AllocateCapacityParams {
    uint productId;
    uint coverAmount;
    uint rewardsDenominator;
    uint period;
    uint globalCapacityRatio;
    uint globalRewardsRatio;
    uint capacityReductionRatio;
    uint initialPrice;
  }

  struct Staker {
    uint96 unstakeAmount;
    uint16 lastUnstakeBucket;
    // FIFO:
    // unstakeRequests mapping keys. zero means no unstake exists.
    uint32 firstUnstakeId;
    uint32 lastUnstakeId;
    // uint80 _unused;
  }

  struct LastPrice {
    uint96 value;
    uint32 lastUpdateTime;
  }

  // TODO: pack these inside Product
  /*
  (productId, poolAddress) => lastPrice
  Last base prices at which a cover was sold by a pool for a particular product.
  */
  mapping(uint => LastPrice) lastBasePrices;

  mapping(uint => uint) targetPrices;

  /* slot 0 */
  // bucket index => pool bucket
  mapping(uint => PoolBucket) public poolBuckets;

  /* slot 1 */
  // product index => bucket index => cover amount expiring
  mapping(uint => mapping(uint => ProductBucket)) public productBuckets;

  /* slot 2 */
  // staker address => staker unstake info
  // todo: unstakes may take a looooong time, consider issuing an nft that represents staker's requests
  mapping(address => Staker) public stakers;

  /* slot 3 */
  // staker address => request id => unstake request
  mapping(address => mapping(uint32 => UnstakeRequest)) unstakeRequests;

  /* slot 4 */
  // product id => product info
  mapping(uint => Product) public products;

  /* slot 5 */
  // array with product ids to be able to iterate them
  // todo: pack me
  uint[] public poolProductsIds;

  // unstakes flow:
  // 1. bucket n: unstake requested
  // 2. bucket n + 2: unstake becomes queued
  // 3. bucket n + 2 + m: unstake is granted

  /* slot 6 */
  uint96 public stakeActive;
  uint96 public stakeInactive;
  uint64 public lastRewardPerSecond;

  uint32 public lastRewardTime;
  uint16 public lastPoolBucketIndex;
  uint16 public lastUnstakeBucketIndex;
  uint16 public totalWeight;
  uint16 public maxTotalWeight; // todo: read from cover

  // IDK if the next three are needed:
  // total actually requested and not yet queued
  uint96 public totalUnstakeRequested;
  // requested at bucket t-2
  uint96 public totalUnstakeQueued;
  // unstaked but not withdrawn
  uint96 public totalUnstakeGranted;

  // used for max unstake
  // max unstake = min(staked - maxCapacity, staked - totalLeverage)
  uint96 public maxCapacity;
  uint96 public totalLeverage;

  address public manager;

  /* immutables */
  ERC20 public immutable nxm;
  address public immutable coverContract;

  /* constants */
  uint public constant TOKEN_PRECISION = 1e18;
  uint public constant PARAM_PRECISION = 10_000;
  uint public constant BUCKET_SIZE = 7 days;

  uint public constant PRICE_CURVE_EXPONENT = 7;
  uint public constant MAX_PRICE_RATIO = 1e20;
  uint public constant PRICE_RATIO_CHANGE_PER_DAY = 100;
  uint public constant PRICE_DENOMINATOR = 10_000;
  uint public constant GLOBAL_CAPACITY_DENOMINATOR = 10_000;
  uint public constant PRODUCT_WEIGHT_DENOMINATOR = 10_000;
  uint public constant CAPACITY_REDUCTION_DENOMINATOR = 10_000;

  // base price bump by 2% for each 10% of capacity used
  uint public constant BASE_PRICE_BUMP_RATIO = 200; // 2%
  uint public constant BASE_PRICE_BUMP_INTERVAL = 1000; // 10%
  uint public constant BASE_PRICE_BUMP_DENOMINATOR = 10_000;

  uint public constant GLOBAL_MIN_PRICE_RATIO = 100; // 1%

  modifier onlyCoverContract {
    require(msg.sender == coverContract, "StakingPool: Caller is not the cover contract");
    _;
  }

  modifier onlyManager {
    require(msg.sender == manager, "StakingPool: Caller is not the manager");
    _;
  }

  constructor (address _nxm, address _coverContract) ERC20("Staked NXM", "SNXM") {
    nxm = ERC20(_nxm);
    coverContract = _coverContract;
  }

  function initialize(address _manager) external onlyCoverContract {
    require(lastPoolBucketIndex == 0, "Staking Pool: Already initialized");
    lastPoolBucketIndex = (block.timestamp / BUCKET_SIZE).toUint16();
    lastUnstakeBucketIndex = (block.timestamp / BUCKET_SIZE).toUint16();
    manager = _manager;
  }

  /* View functions */

  function min(uint a, uint b) internal pure returns (uint) {
    return a < b ? a : b;
  }

  function max(uint a, uint b) internal pure returns (uint) {
    return a > b ? a : b;
  }

  /* State-changing functions */

  function processPoolBuckets() internal returns (uint staked) {

    // 1 SLOAD
    staked = stakeActive;
    uint rewardPerSecond = lastRewardPerSecond;
    uint rewardTime = lastRewardTime;
    uint poolBucketIndex = lastPoolBucketIndex;

    // 1 SLOAD
    uint unstakeQueued = totalUnstakeQueued;

    // get bucket for current time
    uint currentBucketIndex = block.timestamp / BUCKET_SIZE;

    // process expirations, 1 SLOAD / iteration
    // process until current bucket (inclusive, see increment inside the loop)
    while (poolBucketIndex < currentBucketIndex) {

      ++poolBucketIndex;
      uint bucketStartTime = poolBucketIndex * BUCKET_SIZE;
      staked += (bucketStartTime - rewardTime) * rewardPerSecond;
      rewardTime = bucketStartTime;

      // 1 SLOAD for both
      rewardPerSecond -= poolBuckets[poolBucketIndex].rewardPerSecondCut;
      unstakeQueued += poolBuckets[poolBucketIndex].unstakeRequested;
    }

    // if we're mid-bucket, process rewards until current timestamp
    staked += (block.timestamp - rewardTime) * rewardPerSecond;

    // 1 SSTORE
    stakeActive = staked.toUint96();
    lastRewardPerSecond = rewardPerSecond.toUint64();
    lastRewardTime = block.timestamp.toUint32();
    lastPoolBucketIndex = poolBucketIndex.toUint16();

    // 1 SSTORE
    totalUnstakeQueued = (unstakeQueued).toUint96();
  }

  function processUnstakes() internal {

    uint staked = processPoolBuckets();
    uint supply = totalSupply();

    uint currentUnstakeBucketIndex = lastUnstakeBucketIndex;
    uint maxUnstakeBucketIndex = block.timestamp / BUCKET_SIZE - 2;

    // max unstake = min(staked - maxCapacity, staked - totalLeverage)
    // => max unstake = staked - max(maxCapacity, totalLeverage)
    uint maxUsed = max(maxCapacity, totalLeverage);
    uint maxUnstake = staked > maxUsed ? staked - maxUsed : 0;

    // TODO: add grace period check

    // TODO: Flawed because maxCapacity and totalLeverage
    //       - assume the stake is not subtracted upon unstake request
    //       - are in NXM and requested unstake amounts are shares

    while (maxUnstake > 0 && currentUnstakeBucketIndex <= maxUnstakeBucketIndex) {

      // 2 SLOADs
      PoolBucket memory poolBucket = poolBuckets[currentUnstakeBucketIndex];
      uint requested = poolBucket.unstakeRequested - poolBucket.unstaked;

      if (maxUnstake < requested) {
        poolBucket.unstaked += maxUnstake.toUint96();
      }

      if (maxUnstake >= requested) {
        poolBucket.unstaked += requested.toUint96();
        maxUnstake -= requested;
        // done with this one, next!
        ++currentUnstakeBucketIndex;
      }

      uint unstake = maxUnstake >= requested ? requested : maxUnstake;

      if (requested >= maxUnstake) {

        break;
      }

    }

  }

  /* callable by cover contract */

  function allocateCapacity(AllocateCapacityParams calldata params) external returns (uint, uint) {

    uint staked = processPoolBuckets();
    uint currentBucket = block.timestamp / BUCKET_SIZE;

    Product storage product = products[params.productId];
    uint activeCoverAmount = product.activeCoverAmount;
    uint lastBucket = product.lastBucket;

    // process expirations
    while (lastBucket < currentBucket) {
      ++lastBucket;
      activeCoverAmount -= productBuckets[params.productId][lastBucket].expiringCoverAmount;
    }

    // limit cover amount to the amount left available
    uint capacity = (
      staked *
      params.globalCapacityRatio *
      product.weight *
      (CAPACITY_REDUCTION_DENOMINATOR - params.capacityReductionRatio) /
      GLOBAL_CAPACITY_DENOMINATOR /
      PRODUCT_WEIGHT_DENOMINATOR /
      CAPACITY_REDUCTION_DENOMINATOR
    );

    uint coverAmount = min(
      capacity - activeCoverAmount,
      params.coverAmount
    );

    {
      // calculate expiration bucket, reward period, reward amount
      uint expirationBucket = (block.timestamp + params.period) / BUCKET_SIZE + 1;
      uint rewardPeriod = expirationBucket * BUCKET_SIZE - block.timestamp;
      uint addedRewardPerSecond = params.globalRewardsRatio * coverAmount / params.rewardsDenominator / rewardPeriod;

      // update state
      // 1 SLOAD + 3 SSTORE
      lastRewardPerSecond = (lastRewardPerSecond + addedRewardPerSecond).toUint64();
      poolBuckets[expirationBucket].rewardPerSecondCut += addedRewardPerSecond.toUint64();
      productBuckets[params.productId][expirationBucket].expiringCoverAmount += coverAmount.toUint96();

      product.lastBucket = lastBucket.toUint16();
      product.activeCoverAmount = (activeCoverAmount + coverAmount).toUint96();
    }

    // price calculation
    uint actualPrice = getActualPriceAndUpdateBasePrice(
      params.productId,
      coverAmount,
      product.activeCoverAmount,
      activeCoverAmount,
      params.initialPrice
    );

    return (coverAmount, calculatePremium(actualPrice, coverAmount, params.period));
  }

  // TODO: consider burning up to max(99% of total stake, stake - X nxm)
  function burnStake() external {

    //

  }

  /* callable by stakers */

  function stake(uint amount) external {

    // TODO: use operator transfer and transfer to TC instead
    nxm.transferFrom(msg.sender, address(this), amount);

    uint supply = totalSupply();
    uint staked;
    uint shares;

    if (supply == 0) {
      // TODO: consider using sqrt
      shares = amount;
    } else {
      staked = processPoolBuckets();
      shares = supply * amount / staked;
    }

    // TODO: consider reducing unstake requests instead of increasing stake
    stakeActive = (staked + amount).toUint96();
    _mint(msg.sender, shares);

    // TODO: update maxCapacity and totalLeverage
  }

  function requestUnstake(uint shares) external {

    uint staked = processPoolBuckets();
    uint supply = totalSupply();
    uint amount = shares * staked / supply;
    uint currentBucket = block.timestamp / BUCKET_SIZE;

    // should revert if caller doesn't have enough shares
    _burn(msg.sender, shares);
    stakeActive = (staked - amount).toUint96();

    Staker memory staker = stakers[msg.sender];

    // reuse the last request if it was in the same bucket, otherwise create a new one
    if (currentBucket != staker.lastUnstakeBucket) {
      ++staker.lastUnstakeId;
    }

    // SLOAD
    // can potentially read an empty slot which we'll write to anyway
    // but we achieve code deduplication
    UnstakeRequest memory unstakeRequest = unstakeRequests[msg.sender][staker.lastUnstakeId];

    // update memory structs
    uint96 amount96 = amount.toUint96();
    staker.unstakeAmount += amount96;
    unstakeRequest.amount += amount96;
    unstakeRequest.bucketIndex = currentBucket.toUint16();

    // SSTORE
    stakers[msg.sender] = staker;
    unstakeRequests[msg.sender][staker.lastUnstakeId] = unstakeRequest;
  }

  function withdraw(uint amount) external {

    // uint lastUnstakeBucket = lastUnstakeBucketIndex;

  }

  /* Pool management functions */

  function addProduct() external onlyManager {

    //

  }

  function removeProduct() external onlyManager {

    //

  }

  function setWeights() external onlyManager {

    //

  }

  function setTargetPrice(uint productId, uint targetPrice) external onlyManager {
    require(targetPrice >= GLOBAL_MIN_PRICE_RATIO, "StakingPool: Target price must be greater than global min price");
    targetPrices[productId] = targetPrice;
  }

  /* VIEWS */

  /* ========== PRICE CALCULATION ========== */

  function calculatePremium(uint priceRatio, uint coverAmount, uint period) public pure returns (uint) {
    return priceRatio * coverAmount / MAX_PRICE_RATIO * period / 365 days;
  }

  uint public constant SURGE_THRESHOLD = 8e17;
  uint public constant BASE_SURGE_LOADING = 1e16;


  function getActualPriceAndUpdateBasePrice(
    uint productId,
    uint amount,
    uint activeCover,
    uint capacity,
    uint initialPrice
  ) internal returns (uint) {


    (uint actualPrice, uint basePrice) = getPrices(productId, amount, activeCover, capacity, initialPrice);
    // store the last base price
    lastBasePrices[productId] = LastPrice(
      basePrice.toUint96(),
      block.timestamp.toUint32()
    );

    return actualPrice;
  }

  function getPrices(
    uint productId,
    uint amount,
    uint activeCover,
    uint capacity,
    uint initialPrice
  ) public view returns (uint actualPrice, uint basePrice) {

    LastPrice memory lastBasePrice = lastBasePrices[productId];
    basePrice = interpolatePrice(
      lastBasePrice.value != 0 ? lastBasePrice.value : initialPrice,
      targetPrices[productId],
      lastBasePrices[productId].lastUpdateTime,
      block.timestamp
    );

    // calculate actualPrice using the current basePrice
    actualPrice = calculatePrice(amount, basePrice, activeCover, capacity);

    // Bump base price by 2% (200 basis points) per 10% (1000 basis points) of capacity used
    uint priceBump = amount * BASE_PRICE_BUMP_DENOMINATOR / capacity / BASE_PRICE_BUMP_INTERVAL * BASE_PRICE_BUMP_RATIO;
    basePrice = (basePrice + priceBump).toUint96();
  }

  function calculatePrice(
    uint amount,
    uint basePrice,
    uint activeCover,
    uint capacity
  ) public pure returns (uint) {

    uint newActiveCoverAmount = amount + activeCover;
    uint newActiveCoverRatio = newActiveCoverAmount * 1e18 / capacity;

    if (newActiveCoverRatio > SURGE_THRESHOLD) {
      return basePrice;
    }

    uint surgeLoadingRatio = newActiveCoverRatio - SURGE_THRESHOLD;
    uint surgeFraction = surgeLoadingRatio * capacity / newActiveCoverAmount;
    uint surgeLoading = BASE_SURGE_LOADING * surgeLoadingRatio / 1e18 / 2 * surgeFraction / 1e18;

    return basePrice * (1e18 + surgeLoading) / 1e18;
  }

  /**
   * Price changes towards targetPrice from lastPrice by maximum of 1% a day per every 100k NXM staked
   */
  function interpolatePrice(
    uint lastPrice,
    uint targetPrice,
    uint lastPriceUpdate,
    uint currentTimestamp
  ) public pure returns (uint) {

    uint priceChange = (currentTimestamp - lastPriceUpdate) / 1 days * PRICE_RATIO_CHANGE_PER_DAY;

    if (targetPrice > lastPrice) {
      return targetPrice;
    }

    return lastPrice - (lastPrice - targetPrice) * priceChange / PRICE_DENOMINATOR;
  }
}
