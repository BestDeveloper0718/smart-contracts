/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */

import BN from "bn.js";
import { EventData, PastEventOptions } from "web3-eth-contract";

export interface INXMMasterContract
  extends Truffle.Contract<INXMMasterInstance> {
  "new"(meta?: Truffle.TransactionDetails): Promise<INXMMasterInstance>;
}

type AllEvents = never;

export interface INXMMasterInstance extends Truffle.ContractInstance {
  checkIsAuthToGoverned(
    _add: string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<boolean>;

  dAppLocker(txDetails?: Truffle.TransactionDetails): Promise<string>;

  dAppToken(txDetails?: Truffle.TransactionDetails): Promise<string>;

  delegateCallBack: {
    (myid: string, txDetails?: Truffle.TransactionDetails): Promise<
      Truffle.TransactionResponse<AllEvents>
    >;
    call(myid: string, txDetails?: Truffle.TransactionDetails): Promise<void>;
    sendTransaction(
      myid: string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<string>;
    estimateGas(
      myid: string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<number>;
  };

  getLatestAddress(
    _contractName: string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<string>;

  isInternal(
    _add: string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<boolean>;

  isMember(
    _add: string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<boolean>;

  isOwner(
    _add: string,
    txDetails?: Truffle.TransactionDetails
  ): Promise<boolean>;

  isPause(txDetails?: Truffle.TransactionDetails): Promise<boolean>;

  masterInitialized(txDetails?: Truffle.TransactionDetails): Promise<boolean>;

  owner(txDetails?: Truffle.TransactionDetails): Promise<string>;

  pauseTime(txDetails?: Truffle.TransactionDetails): Promise<BN>;

  tokenAddress(txDetails?: Truffle.TransactionDetails): Promise<string>;

  updatePauseTime: {
    (
      _time: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<Truffle.TransactionResponse<AllEvents>>;
    call(
      _time: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<void>;
    sendTransaction(
      _time: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<string>;
    estimateGas(
      _time: number | BN | string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<number>;
  };

  methods: {
    checkIsAuthToGoverned(
      _add: string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<boolean>;

    dAppLocker(txDetails?: Truffle.TransactionDetails): Promise<string>;

    dAppToken(txDetails?: Truffle.TransactionDetails): Promise<string>;

    delegateCallBack: {
      (myid: string, txDetails?: Truffle.TransactionDetails): Promise<
        Truffle.TransactionResponse<AllEvents>
      >;
      call(myid: string, txDetails?: Truffle.TransactionDetails): Promise<void>;
      sendTransaction(
        myid: string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<string>;
      estimateGas(
        myid: string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<number>;
    };

    getLatestAddress(
      _contractName: string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<string>;

    isInternal(
      _add: string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<boolean>;

    isMember(
      _add: string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<boolean>;

    isOwner(
      _add: string,
      txDetails?: Truffle.TransactionDetails
    ): Promise<boolean>;

    isPause(txDetails?: Truffle.TransactionDetails): Promise<boolean>;

    masterInitialized(txDetails?: Truffle.TransactionDetails): Promise<boolean>;

    owner(txDetails?: Truffle.TransactionDetails): Promise<string>;

    pauseTime(txDetails?: Truffle.TransactionDetails): Promise<BN>;

    tokenAddress(txDetails?: Truffle.TransactionDetails): Promise<string>;

    updatePauseTime: {
      (
        _time: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<Truffle.TransactionResponse<AllEvents>>;
      call(
        _time: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<void>;
      sendTransaction(
        _time: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<string>;
      estimateGas(
        _time: number | BN | string,
        txDetails?: Truffle.TransactionDetails
      ): Promise<number>;
    };
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