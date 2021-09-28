// SPDX-License-Identifier: GPL-3.0-only

pragma solidity ^0.8.0;

import "@openzeppelin/contracts-v4/token/ERC721/IERC721Receiver.sol";

import "../../interfaces/INXMToken.sol";
import "../../interfaces/IMemberRoles.sol";
import "../../interfaces/IPool.sol";
import "../../interfaces/ICover.sol";
import "../../interfaces/IClaims.sol";
import "../../interfaces/IAssessment.sol";
import "../../interfaces/IERC20Detailed.sol";

import "../../abstract/MasterAwareV2.sol";
import "hardhat/console.sol";

/**
 *  Provides a way for cover owners to submit claims and redeem the payouts and facilitates
 *  assessment processes where members decide the outcome of the events that lead to potential
 *  payouts.
 */
contract Claims is IClaims, IERC721Receiver, MasterAwareV2 {

  // Ratios are defined between 0-10000 bps (i.e. double decimal precision percentage)
  uint internal constant RATIO_BPS = 10000;

  // Used in operations involving NXM tokens and divisions
  uint internal constant PRECISION = 10 ** 18;


  /* ========== STATE VARIABLES ========== */

  INXMToken internal immutable nxm;

  Configuration public override config;

  Claim[] public override claims;
  address[] public override claimants;

  /* ========== CONSTRUCTOR ========== */

  constructor(address nxmAddress) {
    nxm = INXMToken(nxmAddress);
  }

  function initialize(address masterAddress) external {
    // The minimum cover premium per year is 2.6%. 20% of the cover premium is: 2.6% * 20% = 0.52%
    config.rewardRatio = 130; // 0.52%
    config.minAssessmentDepositRatio = 500; // 5% i.e. 0.05 ETH assessment minimum flat fee
    master = INXMMaster(masterAddress);
  }

  /* ========== VIEWS ========== */

  function max(uint a, uint b) internal pure returns (uint) {
    return a > b ? a : b;
  }

  function cover() internal view returns (ICover) {
    return ICover(getInternalContractAddress(ID.CO));
  }

  function assessment() internal view returns (IAssessment) {
    return IAssessment(getInternalContractAddress(ID.AS));
  }

  function pool() internal view returns (IPool) {
    return IPool(getInternalContractAddress(ID.P1));
  }

  function getClaimsCount() external override view returns (uint) {
    return claims.length;
  }

  function _getAssessmentDepositAndReward(
    uint requestedAmount,
    uint coverPeriod,
    uint payoutAsset
  ) internal view returns (uint, uint) {
    uint nxmPriceInPayoutAsset = pool().getTokenPrice(payoutAsset);
    uint nxmPriceInETH = pool().getTokenPrice(0);

    // Calculate the expected in NXM using the NXM price at cover purchase time
    uint expectedPayoutInNXM = requestedAmount * PRECISION / nxmPriceInPayoutAsset;

    // Determine the total rewards that should be minted for the assessors based on cover period
    uint totalReward = max(
      config.maxRewardNXM * PRECISION,
      expectedPayoutInNXM * config.rewardRatio * coverPeriod / 365 days / RATIO_BPS
    );

    uint dynamicDeposit = totalReward * nxmPriceInETH / PRECISION;
    uint minDeposit = 1 ether * uint(config.minAssessmentDepositRatio) / RATIO_BPS;

    // If dynamicDeposit falls below minDeposit use minDeposit instead
    uint deposit = minDeposit > dynamicDeposit ? minDeposit : dynamicDeposit;

    return (deposit, totalReward);
  }

  function getAssessmentDepositAndReward(
    uint requestedAmount,
    uint coverPeriod,
    uint payoutAsset
  ) external view returns (uint, uint) {
    return _getAssessmentDepositAndReward(requestedAmount, coverPeriod, payoutAsset);
  }

  /**
   *  Returns a Claim aggregated in a human-friendly format.
   *
   *  @dev This view is meant to be used in user interfaces to get a claim in a format suitable for
   *  displaying all relevant information in as few calls as possible. See ClaimDisplay struct.
   *
   *  @param id    Claim identifier for which the ClaimDisplay is returned
   */
  function getClaimDisplay(uint id) internal view returns (ClaimDisplay memory) {
    Claim memory claim = claims[id];
    (IAssessment.Poll memory poll,,) = assessment().assessments(claim.assessmentId);

    ClaimStatus claimStatus;
    PayoutStatus payoutStatus;
    {
      // Determine the claims status
      if (block.timestamp < poll.end) {
        claimStatus = ClaimStatus.PENDING;
      } else if (poll.accepted > poll.denied) {
        claimStatus = ClaimStatus.ACCEPTED;
      } else {
        claimStatus = ClaimStatus.DENIED;
      }

      // Determine the payout status
      if (claimStatus == ClaimStatus.ACCEPTED) {
        if (claim.payoutRedeemed) {
          payoutStatus = PayoutStatus.COMPLETE;
        } else {
          (,,uint8 payoutCooldownDays) = assessment().config();
          if (
            block.timestamp >= poll.end +
            payoutCooldownDays * 1 days +
            config.payoutRedemptionPeriodDays * 1 days
          ) {
            payoutStatus = PayoutStatus.UNCLAIMED;
          } else {
            payoutStatus = PayoutStatus.PENDING;
          }
        }
      } else if (claimStatus == ClaimStatus.DENIED) {
        payoutStatus = PayoutStatus.DENIED;
      } else {
        payoutStatus = PayoutStatus.PENDING;
      }
    }

    (
      uint24 productId,
      uint8 payoutAsset,
      /*uint96 amount*/,
      uint32 coverStart,
      uint32 coverPeriod,
      /*uint80 nxmPrice*/
    ) = cover().covers(claim.coverId);

    uint coverEnd = coverStart + coverPeriod;

    string memory assetSymbol;
    if (claim.payoutAsset == 0) {
      assetSymbol = "ETH";
    } else {
      try IERC20Detailed(pool().assets(claim.payoutAsset)).symbol() returns (string memory v) {
        assetSymbol = v;
      } catch {
        // return assetSymbol as an empty string and use claim.payoutAsset instead in the UI
      }
    }

    return ClaimDisplay(
      id,
      productId,
      claim.coverId,
      claim.amount,
      assetSymbol,
      claim.payoutAsset,
      coverStart,
      coverEnd,
      poll.start,
      poll.end,
      uint(claimStatus),
      uint(payoutStatus)
    );
  }

  /**
   *  Returns an array of claims aggregated in a human-friendly format.
   *
   *  @dev This view is meant to be used in user interfaces to get claims in a format suitable for
   *  displaying all relevant information in as few calls as possible. It can be used to paginate
   *  claims by providing the following paramterers:
   *
   *  @param ids   Array of Claim ids which are returned as ClaimDisplay
   */
  function getClaimsToDisplay (uint104[] calldata ids)
  external view returns (ClaimDisplay[] memory) {
    ClaimDisplay[] memory claimDisplays = new ClaimDisplay[](ids.length);
    for (uint i = 0; i < ids.length; i++) {
      uint104 id = ids[i];
      claimDisplays[i] = getClaimDisplay(id);
    }
    return claimDisplays;
  }

  /* === MUTATIVE FUNCTIONS ==== */

  /**
   *  Submits a claim for assessment
   *
   *  @dev This function requires an ETH assessment fee. See: _getAssessmentDepositAndReward
   *
   *  @param coverId          Cover identifier
   *  @param requestedAmount  The amount expected to be received at payout
   *  @param ipfsProofHash    The IPFS hash required for proof of loss. If this string is empty,
   *                          no ProofSubmitted event is emitted.
   */
  function submitClaim(
    uint24 coverId,
    uint96 requestedAmount,
    string calldata ipfsProofHash
  ) external payable override onlyMember {
    uint32 coverStart;
    uint32 coverPeriod;
    uint8 payoutAsset;
    {
      uint96 coverAmount;
      uint24 productId;
      (
        productId,
        payoutAsset,
        coverAmount,
        coverStart,
        coverPeriod,
        /*uint80 nxmPrice*/
      ) = cover().covers(coverId);
      (
        uint16 productType,
        /*address productAddress*/,
        /*uint payoutAssets*/
      ) = cover().products(productId);
      (
        /*string descriptionIpfsHash*/,
        uint8 redeemMethod,
        uint16 gracePeriodInDays,
        /*uint16 burnRatio*/
      ) = cover().productTypes(productType);
      require(redeemMethod == uint8(ICover.RedeemMethod.Claim), "Invalid redeem method");
      require(requestedAmount <= coverAmount, "Covered amount exceeded");
      require(coverStart <= block.timestamp, "Cover starts in the future");
      require(coverStart + coverPeriod + gracePeriodInDays * 1 days > block.timestamp, "Cover is outside the grace period");
    }

    {
      address owner = cover().ownerOf(coverId);
      claimants.push(owner);
      cover().transferFrom(owner, address(this), coverId);
    }

    if (bytes(ipfsProofHash).length > 0) {
      emit ProofSubmitted(coverId, msg.sender, ipfsProofHash);
    }

    Claim memory claim = Claim(
      0,
      coverId,
      requestedAmount,
      payoutAsset,
      false, // payoutRedeemed
      false // coverRedeemed
    );

    (uint deposit, uint totalReward) = _getAssessmentDepositAndReward(
      requestedAmount,
      coverPeriod,
      payoutAsset
    );

    require(
      msg.value >= deposit,
      "Assessment deposit is insufficient"
    );

    uint assessmentId = assessment().startAssessment(totalReward, deposit);
    claim.assessmentId = uint80(assessmentId);
    claims.push(claim);

    if (msg.value > deposit) {
      (bool refunded, /* bytes data */) = msg.sender.call{value: msg.value - deposit}("");
      require(refunded, "Assessment deposit refund failed");
    }
  }

  function redeemClaimPayout(uint104 claimId) external override {
    Claim memory claim = claims[claimId];
    (
      IAssessment.Poll memory poll,
      /*uint128 totalAssessmentReward*/,
      uint assessmentDeposit
    ) = assessment().assessments(claim.assessmentId);

    require(poll.accepted > poll.denied, "The claim needs to be accepted");

    (,,uint8 payoutCooldownDays) = assessment().config();
    require(
      block.timestamp >= poll.end + payoutCooldownDays * 1 days,
      "The claim is in cooldown period"
    );

    require(
      block.timestamp < poll.end +
      payoutCooldownDays * 1 days +
      config.payoutRedemptionPeriodDays * 1 days,
      "The redemption period has expired"
    );

    require(!claim.payoutRedeemed, "Payout has already been redeemed");
    claims[claimId].payoutRedeemed = true;

    address payable coverOwner = payable(claimants[claim.coverId]);
    cover().performPayoutBurn(
      claim.coverId,
      coverOwner,
      claim.amount
    );

    bool succeeded = pool().sendClaimPayout(claim.payoutAsset, coverOwner, claim.amount);
    require(succeeded, "Claim payout failed");

    {
      (bool refunded, /* bytes data */) = coverOwner.call{value: assessmentDeposit}("");
      require(refunded, "Assessment deposit refund failed");
    }
  }

  function redeemCoverForDeniedClaim(uint claimId) external override {
    Claim memory claim = claims[claimId];

    (
      IAssessment.Poll memory poll,
      /*uint128 totalReward*/,
      uint128 assessmentDeposit
    ) = assessment().assessments(claim.assessmentId);

    require(!claim.coverRedeemed, "Cover was already redeemed");

    // A cover can be redeemed if the claim is either denied or the payout is not claimed before
    // the payout redemption period.
    (,,uint8 payoutCooldownDays) = assessment().config();
    if (poll.accepted > poll.denied) {
      if (
        block.timestamp < poll.end +
        payoutCooldownDays * 1 days +
        config.payoutRedemptionPeriodDays * 1 days
      ) {
        revert("A payout can still be claimed");
      }
      revert("A cover can be redeemed only if the claim was denied");
    } else if (block.timestamp < poll.end + payoutCooldownDays * 1 days) {
      // Sometimes the resolution of a fraudulent assessmnt could potentially change the outcome of
      // the assessment, thus it is necessary to keep the cover NFT in this contract to be able to
      // redeem the payout afterwards.
      revert("The claim is in cooldown period");
    }

    cover().transferFrom(address(this), claimants[claimId], claim.coverId);
    claims[claimId].coverRedeemed = true;
    (bool succeeded, /* bytes data */) = getInternalContractAddress(ID.P1).call{value: assessmentDeposit}("");
    require(succeeded, "Deposit transfer to pool failed");
  }

  function updateUintParameters(UintParams[] calldata paramNames, uint[] calldata values)
  external override onlyGovernance {
    Configuration memory newConfig = config;
    for (uint i = 0; i < paramNames.length; i++) {
      if (paramNames[i] == UintParams.payoutRedemptionPeriodDays) {
        newConfig.payoutRedemptionPeriodDays = uint8(values[i]);
        continue;
      }
      if (paramNames[i] == UintParams.rewardRatio) {
        newConfig.rewardRatio = uint16(values[i]);
        continue;
      }
      if (paramNames[i] == UintParams.minAssessmentDepositRatio) {
        newConfig.minAssessmentDepositRatio = uint16(values[i]);
        continue;
      }
    }
    config = newConfig;
  }

  function changeDependentContractAddress() external override {
    internalContracts[uint(ID.TC)] = master.getLatestAddress("TC");
    internalContracts[uint(ID.MR)] = master.getLatestAddress("MR");
    internalContracts[uint(ID.P1)] = master.getLatestAddress("P1");
    internalContracts[uint(ID.CO)] = master.getLatestAddress("CO");
    internalContracts[uint(ID.AS)] = master.getLatestAddress("AS");
  }

  // Required to receive NFTS
  function onERC721Received(
    address operator,
    address from,
    uint256 tokenId,
    bytes calldata data
  ) external view override returns (bytes4) {
    require(msg.sender == internalContracts[uint(ID.CO)], "Unexpected NFT");
    return IERC721Receiver.onERC721Received.selector;
  }

}