const { ethers } = require('hardhat');
const { time } = require('@openzeppelin/test-helpers');
const { assert, expect } = require('chai');

const { submitClaim, daysToSeconds, ASSET } = require('./helpers');

const { parseEther } = ethers.utils;

describe('submitClaim', function () {
  it('reverts if the submission deposit is not sent', async function () {
    assert(false, '[todo]');
  });

  it('reverts if the requested amount exceeds cover amount', async function () {
    assert(false, '[todo]');
  });

  it('reverts if cover is outside of the grace period', async function () {
    assert(false, '[todo]');
  });

  it('reverts if called by non-member address', async function () {
    const { assessment, cover } = this.contracts;
    const coverOwner = this.accounts[1];
    const nonMemberOwner = this.accounts[10];
    await cover.buyCover(
      coverOwner.address,
      0, // productId
      ASSET.ETH,
      parseEther('100'),
      daysToSeconds(30),
      parseEther('2.6'),
      [],
    );
    const coverId = 0;
    cover.connect(coverOwner).transferFrom(coverOwner.address, nonMemberOwner.address, coverId);
    await cover.connect(nonMemberOwner).approve(assessment.address, 0);
    expect(submitClaim(this)({ coverId, sender: nonMemberOwner })).to.be.reverted;
  });

  it('reverts if it is not called by cover owner ', async function () {
    const { assessment, cover } = this.contracts;
    const coverOwner = this.accounts[1];
    await cover.buyCover(
      coverOwner.address,
      0, // productId
      ASSET.ETH,
      parseEther('100'),
      daysToSeconds(30),
      parseEther('2.6'),
      [],
    );
    const coverId = 0;
    await cover.connect(coverOwner).approve(assessment.address, 0);
    expect(submitClaim(this)({ coverId, sender: this.accounts[0] })).to.be.reverted;
  });

  it('emits ProofSubmitted event with the provided ipfsProofHash if hasProof is true', async function () {
    const { assessment, cover } = this.contracts;
    const ipfsProofHash = 'ipfsProofHashMock';
    const coverOwner = this.accounts[1];
    await cover.buyCover(
      coverOwner.address,
      0, // productId
      ASSET.ETH,
      parseEther('100'),
      daysToSeconds(30),
      parseEther('2.6'),
      [],
    );
    const coverId = 0;
    await cover.connect(coverOwner).approve(assessment.address, coverId);
    await expect(submitClaim(this)({ coverId, hasProof: true, ipfsProofHash, sender: coverOwner }))
      .to.emit(assessment, 'ProofSubmitted')
      .withArgs(0, coverOwner.address, ipfsProofHash);
  });

  it("doesn't emit ProofSubmitted event if hasProof is false", async function () {
    const { assessment, cover } = this.contracts;
    const coverOwner = this.accounts[1];
    await cover.buyCover(
      coverOwner.address,
      0, // productId
      ASSET.ETH,
      parseEther('100'),
      daysToSeconds(30),
      parseEther('2.6'),
      [],
    );
    const coverId = 0;
    await cover.connect(coverOwner).approve(assessment.address, coverId);
    await expect(submitClaim(this)({ coverId, hasProof: false, sender: coverOwner }))
      .not.to.emit(assessment, 'ProofSubmitted')
      .withArgs(0, coverOwner.address);
  });

  it('transfers the cover NFT to the Assessment contract', async function () {
    const { assessment, cover } = this.contracts;
    await cover.buyCover(
      this.accounts[1].address,
      0, // productId
      ASSET.ETH,
      parseEther('100'),
      daysToSeconds(30),
      parseEther('2.6'),
      [],
    );
    await cover.connect(this.accounts[1]).approve(assessment.address, 0);
    const coverId = 0;
    await submitClaim(this)({ coverId });
    const owner = await cover.ownerOf(coverId);
    assert.equal(owner, assessment.address);
  });

  it('stores the claimant address to whom it might return the cover NFT afterwards', async function () {
    const { assessment, cover } = this.contracts;
    await cover.buyCover(
      this.accounts[1].address,
      0, // productId
      ASSET.ETH,
      parseEther('100'),
      daysToSeconds(30),
      parseEther('2.6'),
      [],
    );
    await cover.connect(this.accounts[1]).approve(assessment.address, 0);
    await submitClaim(this)(0);
    const claimant = await assessment.claimants(0);
    assert.equal(claimant, this.accounts[1].address);
  });

  it("stores a claim whose poll starts at the block's timestamp", async function () {
    const { assessment, cover } = this.contracts;
    await cover.buyCover(
      this.accounts[1].address,
      0, // productId
      ASSET.ETH,
      parseEther('100'),
      daysToSeconds(30),
      parseEther('2.6'),
      [],
    );
    await cover.connect(this.accounts[1]).approve(assessment.address, 0);
    await submitClaim(this)(0);
    const expectedStart = await time.latest();
    const claim = await assessment.claims(0);
    assert.equal(claim.poll.start, expectedStart.toNumber());
  });

  it("stores a claim whose poll ends after minVotingPeriodDays from the block's timestamp", async function () {
    const { assessment, cover } = this.contracts;
    await cover.buyCover(
      this.accounts[1].address,
      0, // productId
      ASSET.ETH,
      parseEther('100'),
      daysToSeconds(30),
      parseEther('2.6'),
      [],
    );
    await cover.connect(this.accounts[1]).approve(assessment.address, 0);
    await submitClaim(this)(0);
    const timestamp = await time.latest();
    const expectedEnd = timestamp.toNumber() + daysToSeconds(this.config.minVotingPeriodDays);
    const claim = await assessment.claims(0);
    assert.equal(claim.poll.end, expectedEnd);
  });
});