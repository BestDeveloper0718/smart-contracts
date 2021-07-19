const { accounts, web3 } = require('hardhat');
const { expectEvent, expectRevert, time, ether } = require('@openzeppelin/test-helpers');
const { assert } = require('chai');
const { ProposalCategory } = require('../utils').constants;
const { submitProposal } = require('../utils').governance;
const { hex } = require('../utils').helpers;

const [owner, emergencyAdmin, unknown] = accounts;

const Claims = artifacts.require('Claims');
const ClaimsReward = artifacts.require('ClaimsReward');
const MCR = artifacts.require('DisposableMCR');
const TokenFunctions = artifacts.require('TokenFunctions');
const Pool = artifacts.require('Pool');
const Quotation = artifacts.require('Quotation');
const NXMaster = artifacts.require('NXMaster');
const MemberRoles = artifacts.require('MemberRoles');
const TokenController = artifacts.require('TokenController');
const Governance = artifacts.require('Governance');
const PooledStaking = artifacts.require('PooledStaking');
const Gateway = artifacts.require('Gateway');
const Incidents = artifacts.require('Incidents');
const OwnedUpgradeabilityProxy = artifacts.require('OwnedUpgradeabilityProxy');
const MMockNewContract = artifacts.require('MMockNewContract');
const ProposalCategoryContract = artifacts.require('ProposalCategory');

const ZERO_ADDRESS = '0x0000000000000000000000000000000000000000';

describe('master', function () {

  it('adds new contract', async function () {
    const { master, gv, pc, tk } = this.contracts;

    const code = hex('XX');
    const newContract = await MMockNewContract.new();
    const actionData = web3.eth.abi.encodeParameters(['bytes2', 'address', 'uint'], [code, newContract.address, '1']);
    await submitProposal(gv, ProposalCategory.newContract, actionData, [owner]);

    const address = await master.getLatestAddress(code);
    assert.equal(address, newContract.address);
  });

  it('replace contract', async function () {
    const { master, gv, pc, tk } = this.contracts;

    const code = hex('QT');
    const quotation = await Quotation.new();

    const contractCodes = [code];
    const newAddresses = [quotation.address];

    const upgradeContractsData = web3.eth.abi.encodeParameters(
      ['bytes2[]', 'address[]'],
      [
        contractCodes,
        newAddresses,
      ],
    );

    await submitProposal(gv, ProposalCategory.upgradeNonProxy, upgradeContractsData, [owner]);

    const address = await master.getLatestAddress(code);
    assert.equal(address, quotation.address);
  });

  it('upgrade proxy contract', async function () {
    const { master, gv, pc, tk } = this.contracts;

    const code = hex('PS');
    const pooledStaking = await PooledStaking.new();

    const contractCodes = [code];
    const newAddresses = [pooledStaking.address];

    const upgradeContractsData = web3.eth.abi.encodeParameters(
      ['bytes2[]', 'address[]'],
      [
        contractCodes,
        newAddresses,
      ],
    );

    await submitProposal(gv, ProposalCategory.upgradeNonProxy, upgradeContractsData, [owner]);

    const address = await master.getLatestAddress(code);

    const implementation = await (await OwnedUpgradeabilityProxy.at(address)).implementation();
    assert.equal(implementation, pooledStaking.address);
  });

  it.only('upgrade proxies and replaceables', async function () {
    const { master, gv, pc, tk } = this.contracts;

    const psCode = hex('PS');
    const qtCode = hex('QT');
    const pooledStaking = await PooledStaking.new();
    const quotation = await Quotation.new();

    const contractCodes = [psCode, qtCode];
    const newAddresses = [pooledStaking.address, quotation.address];

    const upgradeContractsData = web3.eth.abi.encodeParameters(
      ['bytes2[]', 'address[]'],
      [
        contractCodes,
        newAddresses,
      ],
    );

    await submitProposal(gv, ProposalCategory.upgradeNonProxy, upgradeContractsData, [owner]);

    const psAddress = await master.getLatestAddress(psCode);

    const implementation = await (await OwnedUpgradeabilityProxy.at(psAddress)).implementation();
    assert.equal(implementation, pooledStaking.address);

    const address = await master.getLatestAddress(qtCode);
    assert.equal(address, quotation.address);
  });

  it('upgrades master', async function () {
    const { master, gv, pc, tk } = this.contracts;

    const code = hex('MS');
    const newMaster = await NXMaster.new();

    const contractCodes = [code];
    const newAddresses = [newMaster.address];

    const upgradeContractsData = web3.eth.abi.encodeParameters(
      ['bytes2[]', 'address[]'],
      [
        contractCodes,
        newAddresses,
      ],
    );

    await submitProposal(gv, ProposalCategory.upgradeNonProxy, upgradeContractsData, [owner]);

    const msAddress = await master.getLatestAddress(code);
    const implementation = await (await OwnedUpgradeabilityProxy.at(msAddress)).implementation();
    assert.equal(implementation, newMaster.address);
  });

  it('upgrades all contracts', async function () {
    const { master, gv, dai, priceFeedOracle } = this.contracts;

    const contractCodes = ['QT', 'TF', 'TC', 'CL', 'CR', 'P1', 'MC', 'GV', 'PC', 'MR', 'PS', 'GW']; // 'IC'];
    const newAddresses = [
      await Quotation.new(),
      await TokenFunctions.new(),
      await TokenController.new(),
      await Claims.new(),
      await ClaimsReward.new(master.address, dai.address),
      await Pool.new(
        [dai.address], // assets
        [0], // min amounts
        [ether('100')], // max amounts
        [ether('0.01')], // max slippage 1%
        master.address,
        priceFeedOracle.address,
        ZERO_ADDRESS,
      ),
      await MCR.new(ZERO_ADDRESS),
      await Governance.new(),
      await ProposalCategoryContract.new(),
      await MemberRoles.new(),
      await PooledStaking.new(),
      await Gateway.new(),
      // await Incidents.new()
    ].map(c => c.address);

    const upgradable = ['CL', 'CR', 'MC', 'P1', 'QT', 'TF'];

    const upgradeContractsData = web3.eth.abi.encodeParameters(
      ['bytes2[]', 'address[]'],
      [
        contractCodes.map(code => hex(code)),
        newAddresses,
      ],
    );

    await submitProposal(gv, ProposalCategory.upgradeNonProxy, upgradeContractsData, [owner]);

    for (let i = 0; i < contractCodes.length; i++) {
      const code = contractCodes[i];
      const expectedAddress = newAddresses[i];
      if (upgradable.includes(code)) {
        const address = await master.getLatestAddress(hex(code));
        assert.equal(address, expectedAddress);
      } else {
        const proxyAddress = await master.getLatestAddress(hex(code));
        const implementation = await (await OwnedUpgradeabilityProxy.at(proxyAddress)).implementation();
        assert.equal(implementation, expectedAddress);
      }
    }
  });
});
