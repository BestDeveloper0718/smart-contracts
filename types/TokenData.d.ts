/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */

import BN from "bn.js";
import { EventData, PastEventOptions } from "web3-eth-contract";

export interface TokenDataContract extends Truffle.Contract<TokenDataInstance> {
  "new"(
    _walletAdd: string,
    meta?: Truffle.TransactionDetails
  ): Promise<TokenDataInstance>;
}

export interface Commission {
  name: "Commission";
  args: {
    stakedContractAddress: string;
    stakerAddress: string;
    scIndex: BN;
    commissionAmount: BN;
    0: string;
    1: string;
    2: BN;
    3: BN;
  };
}

type AllEvents = Commission;

export interface TokenDataInstance extends Truffle.ContractInstance {
  addStake: {
    (
      _stakerAddress: string,
      _stakedContractAddress: string,
      _amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<Truffle.TransactionResponse<AllEvents>>;
    call(
      _stakerAddress: string,
      _stakedContractAddress: string,
      _amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<BN>;
    sendTransaction(
      _stakerAddress: string,
      _stakedContractAddress: string,
      _amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<string>;
    estimateGas(
      _stakerAddress: string,
      _stakedContractAddress: string,
      _amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<number>;
  };

  bookCATokens: {
    (_of: string, txDetails?: Truffle.TransactionDetails): Promise<
      Truffle.TransactionResponse<AllEvents>
    >;
    call(_of: string, txDetails?: Truffle.TransactionDetails): Promise<void>;
    sendTransaction(
      _of: string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<string>;
    estimateGas(
      _of: string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<number>;
  };

  bookTime(txDetails?: Truffle.TransactionDetails): Promise<BN>;

  changeDependentContractAddress: {
    (txDetails?: Truffle.TransactionDetails): Promise<
      Truffle.TransactionResponse<AllEvents>
    >;
    call(txDetails?: Truffle.TransactionDetails): Promise<void>;
    sendTransaction(txDetails?: Truffle.TransactionDetails): Promise<string>;
    estimateGas(txDetails?: Truffle.TransactionDetails): Promise<number>;
  };

  changeMasterAddress: {
    (_masterAddress: string, txDetails?: Truffle.TransactionDetails): Promise<
      Truffle.TransactionResponse<AllEvents>
    >;
    call(
      _masterAddress: string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<void>;
    sendTransaction(
      _masterAddress: string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<string>;
    estimateGas(
      _masterAddress: string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<number>;
  };

  changeWalletAddress: {
    (_address: string, txDetails?: Truffle.TransactionDetails): Promise<
      Truffle.TransactionResponse<AllEvents>
    >;
    call(
      _address: string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<void>;
    sendTransaction(
      _address: string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<string>;
    estimateGas(
      _address: string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<number>;
  };

  depositedCN(
    arg0: number | BN | string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<[BN, boolean]>;

  getStakedContractStakerByIndex(
    _stakedContractAddress: string,
    _stakedContractIndex: number | BN | string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<string>;

  getStakedContractStakerIndex(
    _stakedContractAddress: string,
    _stakedContractIndex: number | BN | string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<BN>;

  getStakedContractStakersLength(
    _stakedContractAddress: string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<BN>;

  getStakerEarnedStakeCommission(
    _stakerAddress: string,
    _stakerIndex: number | BN | string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<BN>;

  getStakerInitialStakedAmountOnContract(
    _stakerAddress: string,
    _stakerIndex: number | BN | string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<BN>;

  getStakerRedeemedStakeCommission(
    _stakerAddress: string,
    _stakerIndex: number | BN | string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<BN>;

  getStakerStakedBurnedByIndex(
    _stakerAddress: string,
    _stakerIndex: number | BN | string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<BN>;

  getStakerStakedContractByIndex(
    _stakerAddress: string,
    _stakerIndex: number | BN | string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<string>;

  getStakerStakedContractIndex(
    _stakerAddress: string,
    _stakerIndex: number | BN | string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<BN>;

  getStakerStakedContractLength(
    _stakerAddress: string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<BN>;

  getStakerStakedUnlockableBeforeLastBurnByIndex(
    _stakerAddress: string,
    _stakerIndex: number | BN | string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<BN>;

  getStakerTotalEarnedStakeCommission(
    _stakerAddress: string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<BN>;

  getStakerTotalReedmedStakeCommission(
    _stakerAddress: string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<BN>;

  getStakerUnlockedStakedTokens(
    _stakerAddress: string,
    _stakerIndex: number | BN | string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<BN>;

  getUintParameters(
    code: string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<[string, BN]>;

  isCATokensBooked(
    _of: string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<boolean>;

  joiningFee(txDetails?: Truffle.TransactionDetails): Promise<BN>;

  lastCompletedStakeCommission(
    arg0: string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<BN>;

  lockCADays(txDetails?: Truffle.TransactionDetails): Promise<BN>;

  lockMVDays(txDetails?: Truffle.TransactionDetails): Promise<BN>;

  lockTokenTimeAfterCoverExp(
    txDetails?: Truffle.TransactionDetails
  ): Promise<BN>;

  ms(txDetails?: Truffle.TransactionDetails): Promise<string>;

  nxMasterAddress(txDetails?: Truffle.TransactionDetails): Promise<string>;

  priceStep(txDetails?: Truffle.TransactionDetails): Promise<BN>;

  pushBurnedTokens: {
    (
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      _amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<Truffle.TransactionResponse<AllEvents>>;
    call(
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      _amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<void>;
    sendTransaction(
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      _amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<string>;
    estimateGas(
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      _amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<number>;
  };

  pushEarnedStakeCommissions: {
    (
      _stakerAddress: string,
      _stakedContractAddress: string,
      _stakedContractIndex: number | BN | string,
      _commissionAmount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<Truffle.TransactionResponse<AllEvents>>;
    call(
      _stakerAddress: string,
      _stakedContractAddress: string,
      _stakedContractIndex: number | BN | string,
      _commissionAmount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<void>;
    sendTransaction(
      _stakerAddress: string,
      _stakedContractAddress: string,
      _stakedContractIndex: number | BN | string,
      _commissionAmount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<string>;
    estimateGas(
      _stakerAddress: string,
      _stakedContractAddress: string,
      _stakedContractIndex: number | BN | string,
      _commissionAmount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<number>;
  };

  pushRedeemedStakeCommissions: {
    (
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      _amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<Truffle.TransactionResponse<AllEvents>>;
    call(
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      _amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<void>;
    sendTransaction(
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      _amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<string>;
    estimateGas(
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      _amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<number>;
  };

  pushUnlockableBeforeLastBurnTokens: {
    (
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      _amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<Truffle.TransactionResponse<AllEvents>>;
    call(
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      _amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<void>;
    sendTransaction(
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      _amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<string>;
    estimateGas(
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      _amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<number>;
  };

  pushUnlockedStakedTokens: {
    (
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      _amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<Truffle.TransactionResponse<AllEvents>>;
    call(
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      _amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<void>;
    sendTransaction(
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      _amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<string>;
    estimateGas(
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      _amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<number>;
  };

  scValidDays(txDetails?: Truffle.TransactionDetails): Promise<BN>;

  setDepositCN: {
    (
      coverId: number | BN | string,
      flag: boolean,
      txDetails?: Truffle.TransactionDetails
    ): Promise<Truffle.TransactionResponse<AllEvents>>;
    call(
      coverId: number | BN | string,
      flag: boolean,
      txDetails?: Truffle.TransactionDetails
    ): Promise<void>;
    sendTransaction(
      coverId: number | BN | string,
      flag: boolean,
      txDetails?: Truffle.TransactionDetails
    ): Promise<string>;
    estimateGas(
      coverId: number | BN | string,
      flag: boolean,
      txDetails?: Truffle.TransactionDetails
    ): Promise<number>;
  };

  setDepositCNAmount: {
    (
      coverId: number | BN | string,
      amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<Truffle.TransactionResponse<AllEvents>>;
    call(
      coverId: number | BN | string,
      amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<void>;
    sendTransaction(
      coverId: number | BN | string,
      amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<string>;
    estimateGas(
      coverId: number | BN | string,
      amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<number>;
  };

  setLastCompletedStakeCommissionIndex: {
    (
      _stakerAddress: string,
      _index: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<Truffle.TransactionResponse<AllEvents>>;
    call(
      _stakerAddress: string,
      _index: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<void>;
    sendTransaction(
      _stakerAddress: string,
      _index: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<string>;
    estimateGas(
      _stakerAddress: string,
      _index: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<number>;
  };

  setStakedContractCurrentBurnIndex: {
    (
      _stakedContractAddress: string,
      _index: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<Truffle.TransactionResponse<AllEvents>>;
    call(
      _stakedContractAddress: string,
      _index: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<void>;
    sendTransaction(
      _stakedContractAddress: string,
      _index: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<string>;
    estimateGas(
      _stakedContractAddress: string,
      _index: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<number>;
  };

  setStakedContractCurrentCommissionIndex: {
    (
      _stakedContractAddress: string,
      _index: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<Truffle.TransactionResponse<AllEvents>>;
    call(
      _stakedContractAddress: string,
      _index: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<void>;
    sendTransaction(
      _stakedContractAddress: string,
      _index: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<string>;
    estimateGas(
      _stakedContractAddress: string,
      _index: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<number>;
  };

  setUnlockableBeforeLastBurnTokens: {
    (
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      _amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<Truffle.TransactionResponse<AllEvents>>;
    call(
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      _amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<void>;
    sendTransaction(
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      _amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<string>;
    estimateGas(
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      _amount: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<number>;
  };

  stakedContractCurrentBurnIndex(
    arg0: string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<BN>;

  stakedContractCurrentCommissionIndex(
    arg0: string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<BN>;

  stakedContractStakeCommission(
    arg0: string,
    arg1: number | BN | string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<[BN, BN]>;

  stakedContractStakers(
    arg0: string,
    arg1: number | BN | string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<[string, BN]>;

  stakerCommissionPer(txDetails?: Truffle.TransactionDetails): Promise<BN>;

  stakerMaxCommissionPer(txDetails?: Truffle.TransactionDetails): Promise<BN>;

  stakerStakedContracts(
    arg0: string,
    arg1: number | BN | string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<[string, BN, BN, BN, BN, BN, BN]>;

  tokenExponent(txDetails?: Truffle.TransactionDetails): Promise<BN>;

  updateUintParameters: {
    (
      code: string,
      val: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<Truffle.TransactionResponse<AllEvents>>;
    call(
      code: string,
      val: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<void>;
    sendTransaction(
      code: string,
      val: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<string>;
    estimateGas(
      code: string,
      val: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<number>;
  };

  walletAddress(txDetails?: Truffle.TransactionDetails): Promise<string>;

  methods: {
    addStake: {
      (
        _stakerAddress: string,
        _stakedContractAddress: string,
        _amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<Truffle.TransactionResponse<AllEvents>>;
      call(
        _stakerAddress: string,
        _stakedContractAddress: string,
        _amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<BN>;
      sendTransaction(
        _stakerAddress: string,
        _stakedContractAddress: string,
        _amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<string>;
      estimateGas(
        _stakerAddress: string,
        _stakedContractAddress: string,
        _amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<number>;
    };

    bookCATokens: {
      (_of: string, txDetails?: Truffle.TransactionDetails): Promise<
        Truffle.TransactionResponse<AllEvents>
      >;
      call(_of: string, txDetails?: Truffle.TransactionDetails): Promise<void>;
      sendTransaction(
        _of: string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<string>;
      estimateGas(
        _of: string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<number>;
    };

    bookTime(txDetails?: Truffle.TransactionDetails): Promise<BN>;

    changeDependentContractAddress: {
      (txDetails?: Truffle.TransactionDetails): Promise<
        Truffle.TransactionResponse<AllEvents>
      >;
      call(txDetails?: Truffle.TransactionDetails): Promise<void>;
      sendTransaction(txDetails?: Truffle.TransactionDetails): Promise<string>;
      estimateGas(txDetails?: Truffle.TransactionDetails): Promise<number>;
    };

    changeMasterAddress: {
      (_masterAddress: string, txDetails?: Truffle.TransactionDetails): Promise<
        Truffle.TransactionResponse<AllEvents>
      >;
      call(
        _masterAddress: string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<void>;
      sendTransaction(
        _masterAddress: string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<string>;
      estimateGas(
        _masterAddress: string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<number>;
    };

    changeWalletAddress: {
      (_address: string, txDetails?: Truffle.TransactionDetails): Promise<
        Truffle.TransactionResponse<AllEvents>
      >;
      call(
        _address: string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<void>;
      sendTransaction(
        _address: string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<string>;
      estimateGas(
        _address: string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<number>;
    };

    depositedCN(
      arg0: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<[BN, boolean]>;

    getStakedContractStakerByIndex(
      _stakedContractAddress: string,
      _stakedContractIndex: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<string>;

    getStakedContractStakerIndex(
      _stakedContractAddress: string,
      _stakedContractIndex: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<BN>;

    getStakedContractStakersLength(
      _stakedContractAddress: string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<BN>;

    getStakerEarnedStakeCommission(
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<BN>;

    getStakerInitialStakedAmountOnContract(
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<BN>;

    getStakerRedeemedStakeCommission(
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<BN>;

    getStakerStakedBurnedByIndex(
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<BN>;

    getStakerStakedContractByIndex(
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<string>;

    getStakerStakedContractIndex(
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<BN>;

    getStakerStakedContractLength(
      _stakerAddress: string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<BN>;

    getStakerStakedUnlockableBeforeLastBurnByIndex(
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<BN>;

    getStakerTotalEarnedStakeCommission(
      _stakerAddress: string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<BN>;

    getStakerTotalReedmedStakeCommission(
      _stakerAddress: string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<BN>;

    getStakerUnlockedStakedTokens(
      _stakerAddress: string,
      _stakerIndex: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<BN>;

    getUintParameters(
      code: string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<[string, BN]>;

    isCATokensBooked(
      _of: string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<boolean>;

    joiningFee(txDetails?: Truffle.TransactionDetails): Promise<BN>;

    lastCompletedStakeCommission(
      arg0: string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<BN>;

    lockCADays(txDetails?: Truffle.TransactionDetails): Promise<BN>;

    lockMVDays(txDetails?: Truffle.TransactionDetails): Promise<BN>;

    lockTokenTimeAfterCoverExp(
      txDetails?: Truffle.TransactionDetails
    ): Promise<BN>;

    ms(txDetails?: Truffle.TransactionDetails): Promise<string>;

    nxMasterAddress(txDetails?: Truffle.TransactionDetails): Promise<string>;

    priceStep(txDetails?: Truffle.TransactionDetails): Promise<BN>;

    pushBurnedTokens: {
      (
        _stakerAddress: string,
        _stakerIndex: number | BN | string,
        _amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<Truffle.TransactionResponse<AllEvents>>;
      call(
        _stakerAddress: string,
        _stakerIndex: number | BN | string,
        _amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<void>;
      sendTransaction(
        _stakerAddress: string,
        _stakerIndex: number | BN | string,
        _amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<string>;
      estimateGas(
        _stakerAddress: string,
        _stakerIndex: number | BN | string,
        _amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<number>;
    };

    pushEarnedStakeCommissions: {
      (
        _stakerAddress: string,
        _stakedContractAddress: string,
        _stakedContractIndex: number | BN | string,
        _commissionAmount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<Truffle.TransactionResponse<AllEvents>>;
      call(
        _stakerAddress: string,
        _stakedContractAddress: string,
        _stakedContractIndex: number | BN | string,
        _commissionAmount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<void>;
      sendTransaction(
        _stakerAddress: string,
        _stakedContractAddress: string,
        _stakedContractIndex: number | BN | string,
        _commissionAmount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<string>;
      estimateGas(
        _stakerAddress: string,
        _stakedContractAddress: string,
        _stakedContractIndex: number | BN | string,
        _commissionAmount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<number>;
    };

    pushRedeemedStakeCommissions: {
      (
        _stakerAddress: string,
        _stakerIndex: number | BN | string,
        _amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<Truffle.TransactionResponse<AllEvents>>;
      call(
        _stakerAddress: string,
        _stakerIndex: number | BN | string,
        _amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<void>;
      sendTransaction(
        _stakerAddress: string,
        _stakerIndex: number | BN | string,
        _amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<string>;
      estimateGas(
        _stakerAddress: string,
        _stakerIndex: number | BN | string,
        _amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<number>;
    };

    pushUnlockableBeforeLastBurnTokens: {
      (
        _stakerAddress: string,
        _stakerIndex: number | BN | string,
        _amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<Truffle.TransactionResponse<AllEvents>>;
      call(
        _stakerAddress: string,
        _stakerIndex: number | BN | string,
        _amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<void>;
      sendTransaction(
        _stakerAddress: string,
        _stakerIndex: number | BN | string,
        _amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<string>;
      estimateGas(
        _stakerAddress: string,
        _stakerIndex: number | BN | string,
        _amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<number>;
    };

    pushUnlockedStakedTokens: {
      (
        _stakerAddress: string,
        _stakerIndex: number | BN | string,
        _amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<Truffle.TransactionResponse<AllEvents>>;
      call(
        _stakerAddress: string,
        _stakerIndex: number | BN | string,
        _amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<void>;
      sendTransaction(
        _stakerAddress: string,
        _stakerIndex: number | BN | string,
        _amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<string>;
      estimateGas(
        _stakerAddress: string,
        _stakerIndex: number | BN | string,
        _amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<number>;
    };

    scValidDays(txDetails?: Truffle.TransactionDetails): Promise<BN>;

    setDepositCN: {
      (
        coverId: number | BN | string,
        flag: boolean,
        txDetails?: Truffle.TransactionDetails
      ): Promise<Truffle.TransactionResponse<AllEvents>>;
      call(
        coverId: number | BN | string,
        flag: boolean,
        txDetails?: Truffle.TransactionDetails
      ): Promise<void>;
      sendTransaction(
        coverId: number | BN | string,
        flag: boolean,
        txDetails?: Truffle.TransactionDetails
      ): Promise<string>;
      estimateGas(
        coverId: number | BN | string,
        flag: boolean,
        txDetails?: Truffle.TransactionDetails
      ): Promise<number>;
    };

    setDepositCNAmount: {
      (
        coverId: number | BN | string,
        amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<Truffle.TransactionResponse<AllEvents>>;
      call(
        coverId: number | BN | string,
        amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<void>;
      sendTransaction(
        coverId: number | BN | string,
        amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<string>;
      estimateGas(
        coverId: number | BN | string,
        amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<number>;
    };

    setLastCompletedStakeCommissionIndex: {
      (
        _stakerAddress: string,
        _index: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<Truffle.TransactionResponse<AllEvents>>;
      call(
        _stakerAddress: string,
        _index: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<void>;
      sendTransaction(
        _stakerAddress: string,
        _index: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<string>;
      estimateGas(
        _stakerAddress: string,
        _index: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<number>;
    };

    setStakedContractCurrentBurnIndex: {
      (
        _stakedContractAddress: string,
        _index: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<Truffle.TransactionResponse<AllEvents>>;
      call(
        _stakedContractAddress: string,
        _index: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<void>;
      sendTransaction(
        _stakedContractAddress: string,
        _index: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<string>;
      estimateGas(
        _stakedContractAddress: string,
        _index: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<number>;
    };

    setStakedContractCurrentCommissionIndex: {
      (
        _stakedContractAddress: string,
        _index: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<Truffle.TransactionResponse<AllEvents>>;
      call(
        _stakedContractAddress: string,
        _index: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<void>;
      sendTransaction(
        _stakedContractAddress: string,
        _index: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<string>;
      estimateGas(
        _stakedContractAddress: string,
        _index: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<number>;
    };

    setUnlockableBeforeLastBurnTokens: {
      (
        _stakerAddress: string,
        _stakerIndex: number | BN | string,
        _amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<Truffle.TransactionResponse<AllEvents>>;
      call(
        _stakerAddress: string,
        _stakerIndex: number | BN | string,
        _amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<void>;
      sendTransaction(
        _stakerAddress: string,
        _stakerIndex: number | BN | string,
        _amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<string>;
      estimateGas(
        _stakerAddress: string,
        _stakerIndex: number | BN | string,
        _amount: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<number>;
    };

    stakedContractCurrentBurnIndex(
      arg0: string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<BN>;

    stakedContractCurrentCommissionIndex(
      arg0: string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<BN>;

    stakedContractStakeCommission(
      arg0: string,
      arg1: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<[BN, BN]>;

    stakedContractStakers(
      arg0: string,
      arg1: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<[string, BN]>;

    stakerCommissionPer(txDetails?: Truffle.TransactionDetails): Promise<BN>;

    stakerMaxCommissionPer(txDetails?: Truffle.TransactionDetails): Promise<BN>;

    stakerStakedContracts(
      arg0: string,
      arg1: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<[string, BN, BN, BN, BN, BN, BN]>;

    tokenExponent(txDetails?: Truffle.TransactionDetails): Promise<BN>;

    updateUintParameters: {
      (
        code: string,
        val: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<Truffle.TransactionResponse<AllEvents>>;
      call(
        code: string,
        val: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<void>;
      sendTransaction(
        code: string,
        val: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<string>;
      estimateGas(
        code: string,
        val: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<number>;
    };

    walletAddress(txDetails?: Truffle.TransactionDetails): Promise<string>;
  };

  getPastEvents(event: string): Promise<EventData[]>;
  getPastEvents(
    event: string,
    options: PastEventOptions,
    callback: (error: Error, event: EventData) => void
  ): Promise<EventData[]>;
  getPastEvents(event: string, options: PastEventOptions): Promise<EventData[]>;
  getPastEvents(
    event: string,
    callback: (error: Error, event: EventData) => void
  ): Promise<EventData[]>;
}