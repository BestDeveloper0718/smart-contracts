// SPDX-License-Identifier: GPL-3.0-only

pragma solidity ^0.5.0;

import "../../modules/cover/QuotationData.sol";

contract TestnetQuotationData is QuotationData {

  constructor(address _authQuoteAdd, address _kycAuthAdd) QuotationData(_authQuoteAdd, _kycAuthAdd) public {
    /* noop */
  }

  function addCover(
    uint16 coverPeriod,
    uint sumAssured,
    address payable userAddress,
    bytes4 currencyCode,
    address scAddress,
    uint premium,
    uint premiumNXM
  ) external {
    uint expiryDate = now.add(uint(coverPeriod).mul(1 days));
    allCovers.push(Cover(userAddress, currencyCode,
      sumAssured, coverPeriod, expiryDate, scAddress, premiumNXM));
    uint cid = allCovers.length.sub(1);
    userCover[userAddress].push(cid);
    emit CoverDetailsEvent(cid, scAddress, sumAssured, expiryDate, premium, premiumNXM, currencyCode);
  }
}