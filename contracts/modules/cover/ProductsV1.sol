pragma solidity >=0.5.0;

import "../../interfaces/IProductsV1.sol";

contract ProductsV1 is IProductsV1 {
  function getNewProductId(address legacyProductId) external override returns (uint24) {
    // [todo] Remove product ids which are not used by covers. Sort them by descending cover count.
    // Replace return values with the actual product ids from v2

    //"name":"Compound Sai",
    //"type": "protocol",
    //"dateAdded":"2020-01-01",
    //"deprecated":true
    if (legacyProductId == 0xF5DCe57282A584D2746FaF1593d3121Fcac444dC) {
      return 0;
    }

    //"name":"bZx V1",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "bsc", "polygon"],
    //"dateAdded":"2020-01-01",
    //"logo":"bzx.png",
    //"github":"https://github.com/bZxNetwork",
    //"messari":""
    if (legacyProductId == 0x8B3d70d628Ebd30D4A2ea82DB95bA2e906c71633) {
      return 0;
    }

    //"name":"Unknown",
    //"type": "protocol",
    //"dateAdded":"2020-01-01",
    //"deprecated":true
    if (legacyProductId == 0x5504a1d88005236147EC86C62cfb53043bD1276a) {
      return 0;
    }

    //"name":"Compound ETH",
    //"type": "protocol",
    //"dateAdded":"2020-01-01",
    //"deprecated":true
    if (legacyProductId == 0x4Ddc2D193948926D02f9B1fE9e1daa0718270ED5) {
      return 0;
    }

    //"name":"0x V2.1",
    //"type": "protocol",
    //"dateAdded":"2020-01-01",
    //"deprecated":true
    if (legacyProductId == 0x080bf510FCbF18b91105470639e9561022937712) {
      return 0;
    }

    //"name":"iearn yDAI V1",
    //"type": "protocol",
    //"dateAdded":"2020-01-01",
    //"deprecated":true
    if (legacyProductId == 0x16de59092dAE5CcF4A1E6439D611fd0653f0Bd01) {
      return 0;
    }

    //"name":"Saturn DAO Token",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded":"2020-01-01",
    //"logo":"saturndao.png",
    //"github":"",
    //"messari":""
    if (legacyProductId == 0xAF350211414C5DC176421Ea05423F0cC494261fB) {
      return 0;
    }

    //"name":"Compound DAI",
    //"type": "protocol",
    //"dateAdded":"2020-01-01",
    //"deprecated":true
    if (legacyProductId == 0x5d3a536E4D6DbD6114cc1Ead35777bAB948E3643) {
      return 0;
    }

    //"name":"Uniswap Exchange Template",
    //"type": "protocol",
    //"dateAdded":"2020-01-01",
    //"deprecated":true
    if (legacyProductId == 0x2157A7894439191e520825fe9399aB8655E0f708) {
      return 0;
    }

    //"name":"Maker Token",
    //"type": "protocol",
    //"dateAdded":"2020-01-01",
    //"deprecated":true
    if (legacyProductId == 0x9f8F72aA9304c8B593d555F12eF6589cC3A579A2) {
      return 0;
    }

    //"name":"Legacy Gnosis MultiSig",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "polygon", "bsc"],
    //"dateAdded":"2020-01-01",
    //"logo":"gnosis-multisig.svg",
    //"github":"https://github.com/gnosis/MultiSigWallet",
    //"messari":"https://messari.io/asset/gnosis/profile"
    if (legacyProductId == 0x6e95C8E8557AbC08b46F3c347bA06F8dC012763f) {
      return 0;
    }

    //"name":"Bancor ETHBNT Token",
    //"type": "protocol",
    //"dateAdded":"2020-01-01",
    //"deprecated":true
    if (legacyProductId == 0xb1CD6e4153B2a390Cf00A6556b0fC1458C4A5533) {
      return 0;
    }

    //"name":"Pool Together DAI",
    //"type": "protocol",
    //"dateAdded":"2020-01-01",
    //"deprecated":true
    if (legacyProductId == 0x29fe7D60DdF151E5b52e5FAB4f1325da6b2bD958) {
      return 0;
    }

    //"name":"Flexacoin Token",
    //"type": "protocol",
    //"dateAdded":"2020-01-01",
    //"deprecated":true
    if (legacyProductId == 0x4a57E687b9126435a9B19E4A802113e266AdeBde) {
      return 0;
    }

    //"name":"dxDAO",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded":"2020-01-01",
    //"logo":"dxdao.png",
    //"github":"",
    //"messari":""
    if (legacyProductId == 0x519b70055af55A007110B4Ff99b0eA33071c720a) {
      return 0;
    }

    //"name":"Nuo",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded":"2020-01-01",
    //"logo":"nuo.png",
    //"github":"https://github.com/NuoNetwork",
    //"messari":""
    if (legacyProductId == 0x802275979B020F0ec871c5eC1db6e412b72fF20b) {
      return 0;
    }

    //"name":"Pool Together SAI",
    //"type": "protocol",
    //"dateAdded":"2020-01-01",
    //"deprecated":true
    if (legacyProductId == 0xb7896fce748396EcFC240F5a0d3Cc92ca42D7d84) {
      return 0;
    }

    //"name":"Pool Together V2",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "polygon"],
    //"dateAdded":"2020-01-01",
    //"logo":"pooltogether.png",
    //"github":"https://github.com/pooltogether",
    //"messari":""
    if (legacyProductId == 0x932773aE4B661029704e731722CF8129e1B32494) {
      return 0;
    }

    //"name":"Argent",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded":"2020-01-01",
    //"logo":"argent.png",
    //"github":"https://github.com/argentlabs",
    //"messari":"https://messari.io/organization/argent"
    if (legacyProductId == 0xB1dD690Cc9AF7BB1a906A9B5A94F94191cc553Ce) {
      return 0;
    }

    //"name":"Hex Token",
    //"type": "protocol",
    //"dateAdded":"2020-01-01",
    //"deprecated":true
    if (legacyProductId == 0x2b591e99afE9f32eAA6214f7B7629768c40Eeb39) {
      return 0;
    }

    //"name":"Uniswap V1 MKR Pool",
    //"type": "protocol",
    //"dateAdded":"2020-01-01",
    //"deprecated":true
    if (legacyProductId == 0x2C4Bd064b998838076fa341A83d007FC2FA50957) {
      return 0;
    }

    //"name":"dydx Perpetual",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "starkware"],
    //"dateAdded":"2020-01-01",
    //"logo":"dydx.svg",
    //"github":"https://github.com/dydxprotocol",
    //"note": "Includes Layer 2.",
    //"messari":"https://messari.io/asset/dydx/profile"
    if (legacyProductId == 0x364508A5cA0538d8119D3BF40A284635686C98c4) {
      return 0;
    }

    //"name":"DAI Token",
    //"type": "protocol",
    //"dateAdded":"2020-01-01",
    //"deprecated":true
    if (legacyProductId == 0x6B175474E89094C44Da98b954EedeAC495271d0F) {
      return 0;
    }

    //"name":"Unknown",
    //"type": "protocol",
    //"dateAdded":"2020-01-01",
    //"deprecated":true
    if (legacyProductId == 0xD5D2b9e9bcd172D5fC8521AFd2C98Dd239F5b607) {
      return 0;
    }

    //"name":"DDEX",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded":"2020-01-01",
    //"logo":"ddex.png",
    //"github":"https://github.com/HydroProtocol",
    //"messari":"https://messari.io/asset/dex/profile"
    if (legacyProductId == 0x241e82C79452F51fbfc89Fac6d912e021dB1a3B7) {
      return 0;
    }

    //"name":"Tornado Cash",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded":"2020-01-01",
    //"logo":"tornado.png",
    //"github":"https://github.com/tornadocash",
    //"messari":""
    if (legacyProductId == 0x12D66f87A04A9E220743712cE6d9bB1B5616B8Fc) {
      return 0;
    }

    //"name":"Deversifi",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "starkware"],
    //"dateAdded":"2020-06-20",
    //"logo":"deversifi.png",
    //"note": "Includes Layer 2.",
    //"github":"https://github.com/deversifi",
    //"messari":""
    if (legacyProductId == 0x5d22045DAcEAB03B158031eCB7D9d06Fad24609b) {
      return 0;
    }

    //"name":"Instadapp Registry",
    //"type": "protocol",
    //"dateAdded":"2020-01-01",
    //"deprecated":true
    if (legacyProductId == 0x498b3BfaBE9F73db90D252bCD4Fa9548Cd0Fd981) {
      return 0;
    }

    //"name":"Maker SCD",
    //"type": "protocol",
    //"dateAdded":"2020-01-01",
    //"deprecated":true
    if (legacyProductId == 0x448a5065aeBB8E423F0896E6c5D525C040f59af3) {
      return 0;
    }

    //"name":"RenVM",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "polygon", "bsc", "fantom", "arbitrum", "avalanche"],
    //"dateAdded":"2020-06-20",
    //"logo":"ren.svg",
    //"github":"https://github.com/renproject",
    //"note": "Includes Bitcoin and other chain integrations.",
    //"messari":"https://messari.io/asset/ren"
    if (legacyProductId == 0xe80d347DF1209a76DD9d2319d62912ba98C54DDD) {
      return 0;
    }

    //"name":"0x V3",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "bsc"],
    //"dateAdded":"2020-01-01",
    //"logo":"0x.png",
    //"github":"https://github.com/0xProject",
    //"messari":"https://messari.io/asset/0x/profile"
    if (legacyProductId == 0xB27F1DB0a7e473304A5a06E54bdf035F671400C0) {
      return 0;
    }

    //"name":"dydx Margin",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded":"2020-01-01",
    //"logo":"dydx.svg",
    //"github":"https://github.com/dydxprotocol",
    //"note": "Layer 1 only.",
    //"messari":"https://messari.io/asset/dydx/profile",
    //"deprecated": true
    if (legacyProductId == 0x1E0447b19BB6EcFdAe1e4AE1694b0C3659614e4e) {
      return 0;
    }

    //"name":"Compound V2",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded":"2020-01-01",
    //"logo":"compoundv2.png",
    //"github":"https://github.com/compound-finance/",
    //"messari":"https://messari.io/asset/compound/profile"
    if (legacyProductId == 0x3d9819210A31b4961b30EF54bE2aeD79B9c9Cd3B) {
      return 0;
    }

    //"name":"Gnosis Safe",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded":"2020-01-01",
    //"logo":"gnosis-safe.png",
    //"github":"https://github.com/gnosis/safe-protocols",
    //"messari":"https://messari.io/asset/gnosis/profile"
    if (legacyProductId == 0x34CfAC646f301356fAa8B21e94227e3583Fe3F5F) {
      return 0;
    }

    //"name":"Uniswap V1",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded":"2020-01-01",
    //"logo":"uniswap.png",
    //"github":"https://github.com/Uniswap",
    //"messari":"https://messari.io/asset/uniswap/profile"
    if (legacyProductId == 0xc0a47dFe034B400B47bDaD5FecDa2621de6c4d95) {
      return 0;
    }

    //"name":"MakerDAO MCD",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded":"2020-01-01",
    //"logo":"makerdao.png",
    //"github":"https://github.com/makerdao",
    //"messari":"https://messari.io/asset/maker/profile"
    if (legacyProductId == 0x35D1b3F3D7966A1DFe207aa4514C12a259A0492B) {
      return 0;
    }

    //"name":"Paraswap - OLD",
    //"type": "protocol",
    //"dateAdded":"2020-01-01",
    //"deprecated":true
    if (legacyProductId == 0x72338b82800400F5488eCa2B5A37270ba3B7A111) {
      return 0;
    }

    //"name":"Aave V1",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded":"2020-01-01",
    //"logo":"aave.png",
    //"github":"https://github.com/aave",
    //"messari":"https://messari.io/asset/ethlend/profile"
    if (legacyProductId == 0xc1D2819CE78f3E15Ee69c6738eB1B400A26e632A) {
      return 0;
    }

    //"name":"Idle Finance - OLD",
    //"type": "protocol",
    //"dateAdded":"2020-01-01",
    //"deprecated":true
    if (legacyProductId == 0x10eC0D497824e342bCB0EDcE00959142aAa766dD) {
      return 0;
    }

    //"name":"Aave Lending Core",
    //"type": "protocol",
    //"dateAdded":"2020-01-01",
    //"deprecated":true
    if (legacyProductId == 0x3dfd23A6c5E8BbcFc9581d2E864a68feb6a076d3) {
      return 0;
    }

    //"name":"Curve fi - OLD",
    //"type": "protocol",
    //"dateAdded":"2020-01-01",
    //"deprecated":true
    if (legacyProductId == 0x45F783CCE6B7FF23B2ab2D70e416cdb7D6055f51) {
      return 0;
    }

    //"name":"1Inch (DEX & Liquidity Pools)",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "bsc", "polygon"],
    //"dateAdded":"2020-01-01",
    //"logo":"1inch.svg",
    //"github":"https://github.com/CryptoManiacsZone/1inchProtocol",
    //"messari":""
    if (legacyProductId == 0x11111254369792b2Ca5d084aB5eEA397cA8fa48B) {
      return 0;
    }

    //"name":"Paraswap OLD",
    //"type": "protocol",
    //"dateAdded":"2020-01-01",
    //"deprecated":true
    if (legacyProductId == 0xF92C1ad75005E6436B4EE84e88cB23Ed8A290988) {
      return 0;
    }

    //"name":"Opyn",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded":"2020-01-01",
    //"logo":"opyn.png",
    //"github":"https://github.com/opynfinance",
    //"messari":""
    if (legacyProductId == 0xb529964F86fbf99a6aA67f72a27e59fA3fa4FEaC) {
      return 0;
    }

    //"name":"Yearn Finance (all vaults)",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "fantom"],
    //"dateAdded":"2020-01-01",
    //"logo":"yearn.svg",
    //"github":"https://github.com/iearn-finance",
    //"note": "Only covers Yearn contracts, not underlying protocols.",
    //"messari":""
    if (legacyProductId == 0x9D25057e62939D3408406975aD75Ffe834DA4cDd) {
      return 0;
    }

    //"name":"Totle",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded":"2020-01-01",
    //"logo":"totle.png",
    //"github":"https://github.com/TotlePlatform",
    //"messari":""
    if (legacyProductId == 0x77208a6000691E440026bEd1b178EF4661D37426) {
      return 0;
    }

    //"name":"Flexa Staking",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded":"2020-01-01",
    //"logo":"flexa.png",
    //"github":"https://github.com/flexahq",
    //"messari":"https://messari.io/asset/flexacoin/profile"
    if (legacyProductId == 0x12f208476F64De6e6f933E55069Ba9596D818e08) {
      return 0;
    }

    //"name": "Idle V3",
    //"type": "protocol",
    //"dateAdded": "2020-06-20",
    //"deprecated": true
    if (legacyProductId == 0x78751B12Da02728F467A44eAc40F5cbc16Bd7934) {
      return 0;
    }

    //"name": "Curve BTC Pools",
    //"type": "protocol",
    //"dateAdded": "2020-06-20",
    //"deprecated": true
    if (legacyProductId == 0x7fC77b5c7614E1533320Ea6DDc2Eb61fa00A9714) {
      return 0;
    }

    //"name": "Curve All Pools (incl staking)",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "polygon", "xdai", "fantom", "arbitrum", "avalanche", "celo"],
    //"dateAdded": "2020-06-20",
    //"logo": "curve.png",
    //"github": "https://github.com/curvefi",
    //"note": "Excluding innovation zone.",
    //"messari": ""
    if (legacyProductId == 0x79a8C46DeA5aDa233ABaFFD40F3A0A2B1e5A4F27) {
      return 0;
    }

    //"name":"Set Protocol",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded":"2020-01-01",
    //"logo":"tokensets.svg",
    //"github":"https://github.com/SetProtocol",
    //"messari":"https://messari.io/asset/set-protocol/profile"
    if (legacyProductId == 0x5B67871C3a857dE81A1ca0f9F7945e5670D986Dc) {
      return 0;
    }

    //"name":"Uniswap V2",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded":"2020-01-01",
    //"logo":"uniswapv2.svg",
    //"github":"https://github.com/Uniswap",
    //"messari":"https://messari.io/asset/uniswap/profile"
    if (legacyProductId == 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f) {
      return 0;
    }

    //"name":"Balancer V1",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "xdai", "arbitrum"],
    //"dateAdded":"2020-06-20",
    //"logo":"balancer.svg",
    //"github":"https://github.com/balancer-labs",
    //"messari":""
    if (legacyProductId == 0x9424B1412450D0f8Fc2255FAf6046b98213B76Bd) {
      return 0;
    }

    //"name":"Ampleforth Tokengeyser",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded":"2020-06-20",
    //"logo":"ampleforth.svg",
    //"github":"https://github.com/ampleforth",
    //"messari":"https://messari.io/asset/ampleforth"
    if (legacyProductId == 0xD36132E0c1141B26E62733e018f12Eb38A7b7678) {
      return 0;
    }

    //"name":"Paraswap V1",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "bsc", "polygon"],
    //"dateAdded":"2020-01-01",
    //"logo":"paraswap.png",
    //"github":"https://github.com/paraswap",
    //"messari":""
    if (legacyProductId == 0x86969d29F5fd327E1009bA66072BE22DB6017cC6) {
      return 0;
    }

    //"name":"Melon V1",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded":"2020-06-20",
    //"logo":"melon.png",
    //"github":"https://github.com/melonproject/protocol",
    //"messari":"https://messari.io/asset/melon-protocol/profile"
    if (legacyProductId == 0x5f9AE054C7F0489888B1ea46824b4B9618f8A711) {
      return 0;
    }

    //"name":"MolochDAO",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded":"2020-01-01",
    //"logo":"moloch.png",
    //"github":"https://github.com/MolochVentures",
    //"messari":"https://messari.io/asset/molochdao/profile"
    if (legacyProductId == 0x1fd169A4f5c59ACf79d0Fd5d91D1201EF1Bce9f1) {
      return 0;
    }

    //"name":"mStable",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "polygon"],
    //"dateAdded":"2020-06-20",
    //"logo":"mstable.svg",
    //"github":"https://github.com/mstable",
    //"messari":""
    if (legacyProductId == 0xAFcE80b19A8cE13DEc0739a1aaB7A028d6845Eb3) {
      return 0;
    }

    //"name":"Synthetix",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "optimism"],
    //"dateAdded":"2020-06-20",
    //"logo":"synthetix.svg",
    //"github":"https://github.com/Synthetixio",
    //"messari":"https://messari.io/asset/synthetix/profile"
    if (legacyProductId == 0xC011a73ee8576Fb46F5E1c5751cA3B9Fe0af2a6F) {
      return 0;
    }

    //"name":"IDEX V1",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "bsc"],
    //"dateAdded":"2020-01-01",
    //"logo":"idex.png",
    //"github":"https://github.com/idexio",
    //"messari":"https://messari.io/asset/aurora-idex/profile"
    if (legacyProductId == 0x2a0c0DBEcC7E4D658f48E01e3fA353F44050c208) {
      return 0;
    }

    //"name":"Kyber (Katalyst)",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded":"2020-07-07",
    //"logo":"kyber.png",
    //"note":"Excludes Kyber DMM.",
    //"github":"https://github.com/kybernetwork",
    //"messari":"https://messari.io/asset/kyber-network/profile"
    if (legacyProductId == 0x9AAb3f75489902f3a48495025729a0AF77d4b11e) {
      return 0;
    }

    //"name": "Bancor",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded": "2020-07-23",
    //"logo": "bancor.png",
    //"github": "https://github.com/bancorprotocol/",
    //"messari": "https://messari.io/asset/bancor/profile"
    if (legacyProductId == 0x1F573D6Fb3F13d689FF844B4cE37794d79a7FF1C) {
      return 0;
    }

    //"name": "UMA",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "polygon", "celo"],
    //"dateAdded": "2020-07-30",
    //"logo": "uma.png",
    //"github": "",
    //"messari": ""
    if (legacyProductId == 0x3e532e6222afe9Bcf02DCB87216802c75D5113aE) {
      return 0;
    }

    //"name": "dForce Yield Market",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "bsc"],
    //"dateAdded": "2020-08-13",
    //"logo": "dforce.svg",
    //"github": "https://github.com/dforce-network/dToken",
    //"messari": ""
    if (legacyProductId == 0x02285AcaafEB533e03A7306C55EC031297df9224) {
      return 0;
    }

    //"name": "Yam Finance V1",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded": "2020-08-13",
    //"logo": "yam.png",
    //"github": "https://github.com/yam-finance/yam-protocol",
    //"messari": "",
    //"deprecated": "true"
    if (legacyProductId == 0x0e2298E3B3390e3b945a5456fBf59eCc3f55DA16) {
      return 0;
    }

    //"name": "Idle V4",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded": "2020-08-14",
    //"logo": "idle.png",
    //"github": "https://github.com/bugduino/idle",
    //"messari": ""
    if (legacyProductId == 0x3fE7940616e5Bc47b0775a0dccf6237893353bB4) {
      return 0;
    }

    //"name": "Mooniswap",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded": "2020-08-25",
    //"logo": "mooniswap.svg",
    //"github": "https://github.com/CryptoManiacsZone/mooniswap",
    //"messari": ""
    if (legacyProductId == 0x71CD6666064C3A1354a3B4dca5fA1E2D3ee7D303)  {
      return 0;
    }

    //"name": "tBTC Contracts V1",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded": "2020-09-28",
    //"logo": "tbtc.svg",
    //"github": "https://github.com/keep-network/",
    //"messari": "https://messari.io/asset/keep-network/profile"
    if (legacyProductId == 0xe20A5C79b39bC8C363f0f49ADcFa82C2a01ab64a)  {
      return 0;
    }

    //"name": "NuCypher Worklock",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded": "2020-09-29",
    //"logo": "nucypher.svg",
    //"github": "https://github.com/nucypher/",
    //"messari": ""
    if (legacyProductId == 0xe9778E69a961e64d3cdBB34CF6778281d34667c2)  {
      return 0;
    }

    //"name": "Akropolis Delphi",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded": "2020-10-01",
    //"logo": "akropolis.svg",
    //"github": "https://github.com/akropolisio",
    //"messari": "https://messari.io/asset/akropolis"
    if (legacyProductId == 0x4C39b37f5F20a0695BFDC59cf10bd85a6c4B7c30)  {
      return 0;
    }

    //"name": "DODO Exchange",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "polygon", "bsc", "arbitrum"],
    //"dateAdded": "2020-10-19",
    //"logo": "dodo.svg",
    //"github": "https://github.com/DODOEX/dodo-smart-protocol",
    //"messari": ""
    if (legacyProductId == 0x3A97247DF274a17C59A3bd12735ea3FcDFb49950)  {
      return 0;
    }

    //"name": "CoFix",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded": "2020-10-26",
    //"logo": "cofix.jpg",
    //"github": "https://github.com/Computable-Finance/CoFiX",
    //"messari": ""
    if (legacyProductId == 0x26aaD4D82f6c9FA6E34D8c1067429C986A055872)  {
      return 0;
    }

    //"name": "Pool Together V3",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "polygon", "bsc", "celo"],
    //"dateAdded": "2020-10-28",
    //"logo": "pooltogether.png",
    //"github": "https://github.com/pooltogether",
    //"messari": "https://docs.pooltogether.com/security/risks"
    if (legacyProductId == 0xCB876f60399897db24058b2d58D0B9f713175eeF)  {
      return 0;
    }

    //"name": "Set Protocol V2",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded": "2020-10-28",
    //"logo": "tokensets.svg",
    //"github": "https://github.com/SetProtocol",
    //"messari": "https://messari.io/asset/set-protocol/profile"
    if (legacyProductId == 0xa4c8d221d8BB851f83aadd0223a8900A6921A349)  {
      return 0;
    }

    //"name": "Yield Protocol",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded": "2020-10-28",
    //"logo": "yield.jpg",
    //"github": "https://github.com/yieldprotocol",
    //"messari": ""
    if (legacyProductId == 0xB94199866Fe06B535d019C11247D3f921460b91A)  {
      return 0;
    }

    //"name": "Eth 2.0 (deposit contract)",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded": "2020-11-06",
    //"logo": "eth2.jpg",
    //"github": "https://github.com/ethereum/eth2.0-specs",
    //"messari": ""
    if (legacyProductId == 0x00000000219ab540356cBB839Cbe05303d7705Fa)  {
      return 0;
    }

    //"name": "Hegic",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded": "2020-11-09",
    //"logo": "hegic.png",
    //"github": "https://github.com/hegic/protocols-v888",
    //"messari": ""
    if (legacyProductId == 0x878F15ffC8b894A1BA7647c7176E4C01f74e140b)  {
      return 0;
    }

    //"name": "Keeper DAO",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded": "2020-11-19",
    //"logo": "keeperdao.jpg",
    //"github": "https://github.com/keeperdao/",
    //"messari": "https://github.com/keeperdao/docs/wiki"
    if (legacyProductId == 0xfA5047c9c78B8877af97BDcb85Db743fD7313d4a)  {
      return 0;
    }

    //"name": "CREAM V1",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "bsc", "polygon", "fantom"],
    //"dateAdded": "2020-11-24",
    //"logo": "cream.png",
    //"github": "https://github.com/CreamFi",
    //"note": "Excluding Iron Bank.",
    //"messari": "https://cream.finance/"
    if (legacyProductId == 0x3d5BC3c8d13dcB8bF317092d84783c2697AE9258)  {
      return 0;
    }

    //"name": "TrueFi",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded": "2020-11-25",
    //"logo": "truefi.jpg",
    //"github": "https://github.com/trusttoken/truefi-spec",
    //"messari": "https://truefi.io/"
    if (legacyProductId == 0x7a9701453249e84fd0D5AfE5951e9cBe9ed2E90f)  {
      return 0;
    }

    //"name": "Alpha Homora V1",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "bsc"],
    //"dateAdded": "2020-11-26",
    //"logo": "alpha-homora.svg",
    //"github": "https://github.com/AlphaFinanceLab/alphahomora",
    //"messari": "https://homora.alphafinance.io/"
    if (legacyProductId == 0x67B66C99D3Eb37Fa76Aa3Ed1ff33E8e39F0b9c7A)  {
      return 0;
    }

    //"name": "Aave V2",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "polygon", "avalanche", "celo"],
    //"dateAdded": "2020-12-03",
    //"logo": "aavev2.svg",
    //"note": "Including AMM market.",
    //"github": "https://github.com/aave/protocol-v2"
    if (legacyProductId == 0x7d2768dE32b0b80b7a3454c06BdAc94A69DDc7A9)  {
      return 0;
    }

    //"name": "SushiSwap V1",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "bsc", "xdai", "fantom", "polygon", "arbitrum", "avalanche", "celo"],
    //"dateAdded": "2020-12-09",
    //"logo": "sushiswap.jpg",
    //"note": "Includes AMM, xSushi Staking, Masterchef V1 and V2. Excludes Kashi Lending and BentoBox.",
    //"github": "https://github.com/sushiswap/sushiswap"
    if (legacyProductId == 0xc2EdaD668740f1aA35E4D8f227fB8E17dcA888Cd)  {
      return 0;
    }

    //"name": "Cover Protocol V1",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "bsc", "xdai", "fantom", "polygon"],
    //"dateAdded": "2020-12-11",
    //"logo": "cover.jpg",
    //"github": "https://github.com/CoverProtocol/"
    if (legacyProductId == 0xedfC81Bf63527337cD2193925f9C0cF2D537AccA)  {
      return 0;
    }

    //"name": "Perpetual Protocol",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "xdai", "arbitrum"],
    //"dateAdded": "2020-12-17",
    //"logo": "perpetual.jpg",
    //"github": "https://github.com/perpetual-protocol/"
    if (legacyProductId == 0xA51156F3F1e39d1036Ca4ba4974107A1C1815d1e)  {
      return 0;
    }

    //"name": "BadgerDAO",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "bsc", "polygon"],
    //"dateAdded": "2020-12-29",
    //"logo": "badgerdao.png",
    //"github": "https://github.com/Badger-Finance",
    //"messari": "https://badger.finance/"
    if (legacyProductId == 0x6354E79F21B56C11f48bcD7c451BE456D7102A36)  {
      return 0;
    }

    //"name": "Notional Finance V1",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded": "2021-01-18",
    //"logo": "notional.png",
    //"github": "https://github.com/notional-finance",
    //"messari": "https://notional.finance/"
    if (legacyProductId == 0x9abd0b8868546105F6F48298eaDC1D9c82f7f683)  {
      return 0;
    }

    //"name": "Origin Dollar",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded": "2021-01-22",
    //"logo": "originusd.svg",
    //"github": "https://github.com/OriginProtocol/origin-dollar",
    //"messari": "https://www.ousd.com"
    if (legacyProductId == 0xE75D77B1865Ae93c7eaa3040B038D7aA7BC02F70)  {
      return 0;
    }

    //"name": "Opyn V2",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded": "2021-02-25",
    //"logo": "opyn.png",
    //"github": "https://github.com/opynfinance",
    //"messari": "https://opyn.co"
    if (legacyProductId == 0x7C06792Af1632E77cb27a558Dc0885338F4Bdf8E)  {
      return 0;
    }

    //"name": "Reflexer",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded": "2021-03-04",
    //"logo": "reflexer.png",
    //"github": "https://github.com/reflexer-labs",
    //"messari": "https://reflexer.finance"
    if (legacyProductId == 0xCC88a9d330da1133Df3A7bD823B95e52511A6962)  {
      return 0;
    }

    //"name": "Vesper",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded": "2021-03-10",
    //"logo": "vesper.svg",
    //"github": "https://github.com/vesperfi",
    //"messari": "https://vesper.finance"
    if (legacyProductId == 0xa4F1671d3Aee73C05b552d57f2d16d3cfcBd0217)  {
      return 0;
    }

    //"name": "Benchmark Protocol",
    //"site": "https://benchmarkprotocol.finance/",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded": "2021-03-22",
    //"logo": "benchmark-protocol.png",
    //"github": "https://github.com/benchmarkprotocol"
    if (legacyProductId == 0x5D9972dD3Ba5602574ABeA6bF9E1713568D49903)  {
      return 0;
    }

    //"name": "Stake DAO",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "bsc", "polygon"],
    //"dateAdded": "2021-03-29",
    //"logo": "stakedao.png",
    //"github": "https://github.com/StakeDAO",
    //"messari": "https://stakedao.org"
    if (legacyProductId == 0xB17640796e4c27a39AF51887aff3F8DC0daF9567)  {
      return 0;
    }

    //"name": "Liquity",
    //"site": "https://liquity.org/",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded": "2021-04-05",
    //"logo": "liquity.png",
    //"github": "https://github.com/liquity"
    if (legacyProductId == 0xA39739EF8b0231DbFA0DcdA07d7e29faAbCf4bb2)  {
      return 0;
    }

    //"name": "Harvest Finance",
    //"site": "https://harvest.finance/",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "polygon", "bsc"],
    //"dateAdded": "2021-04-16",
    //"logo": "harvest.png",
    //"github": "https://github.com/harvest-finance"
    if (legacyProductId == 0x284D7200a0Dabb05ee6De698da10d00df164f61d)  {
      return 0;
    }

    //"name": "Uniswap V3",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "optimism", "arbitrum"],
    //"dateAdded": "2021-05-05",
    //"logo": "uniswapv2.svg",
    //"github": "https://github.com/Uniswap/uniswap-v3-core",
    //"messari": "https://messari.io/asset/uniswap/profile"
    if (legacyProductId == 0x1F98431c8aD98523631AE4a59f267346ea31F984)  {
      return 0;
    }

    //"name": "Barnbridge Smart Yield V1",
    //"site": "https://barnbridge.com",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "polygon"],
    //"dateAdded": "2021-06-14",
    //"logo": "barnbridge.png",
    //"github": "https://github.com/BarnBridge"
    if (legacyProductId == 0x4B8d90D68F26DEF303Dcb6CFc9b63A1aAEC15840)  {
      return 0;
    }

    //"name": "Convex Finance V1",
    //"site": "https://www.convexfinance.com",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded": "2021-06-14",
    //"logo": "convex.png",
    //"github": "https://github.com/convex-eth"
    if (legacyProductId == 0xF403C135812408BFbE8713b5A23a04b3D48AAE31)  {
      return 0;
    }

    //"name": "Alchemix V1",
    //"site": "https://alchemix.fi",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded": "2021-06-14",
    //"logo": "alchemix.png",
    //"github": "https://github.com/alchemix-finance"
    if (legacyProductId == 0xc21D353FF4ee73C572425697f4F5aaD2109fe35b)  {
      return 0;
    }

    //"name": "Alpha Homora V2",
    //"site": "https://homora-v2.alphafinance.io",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "avalanche"],
    //"dateAdded": "2021-06-23",
    //"logo": "alpha-homora.svg",
    //"github": "https://github.com/AlphaFinanceLab/homora-v2"
    if (legacyProductId == 0x99c666810bA4Bf9a4C2318CE60Cb2c279Ee2cF56)  {
      return 0;
    }

    //"name": "Balancer V2",
    //"site": "https://balancer.fi/",
    //"type": "protocol",
    //"supportedChains": ["ethereum", "polygon", "arbitrum"],
    //"dateAdded": "2021-08-04",
    //"logo": "balancer.svg",
    //"github": "https://github.com/balancer-labs"
    if (legacyProductId == 0xBA12222222228d8Ba445958a75a0704d566BF2C8)  {
      return 0;
    }

    //"name": "Alpaca Finance",
    //"site": "https://www.alpacafinance.org/",
    //"type": "protocol",
    //"supportedChains": ["bsc"],
    //"dateAdded": "2021-08-13",
    //"logo": "alpaca.png",
    //"github": "https://github.com/alpaca-finance"
    if (legacyProductId == 0xA625AB01B08ce023B2a342Dbb12a16f2C8489A8F)  {
      return 0;
    }

    //"name": "Visor Finance",
    //"site": "https://www.visor.finance/",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded": "2021-08-20",
    //"logo": "visor.png",
    //"github": "https://github.com/VisorFinance"
    if (legacyProductId == 0x08FB62c84909dA3Aa5F59E01763E5FDC62De76e9)  {
      return 0;
    }

    //"name": "Goldfinch",
    //"site": "https://www.goldfinch.finance",
    //"type": "protocol",
    //"supportedChains": ["ethereum"],
    //"dateAdded": "2021-09-24",
    //"logo": "goldfinch.svg",
    //"github": " https://github.com/goldfinch-eng/"
    if (legacyProductId == 0x8481a6EbAf5c7DABc3F7e09e44A89531fd31F822)  {
      return 0;
    }

    //"name": "Celsius",
    //"site": "https://celsius.network/",
    //"type": "custodian",
    //"dateAdded": "2020-12-02",
    //"logo": "celsius.svg"
    if (legacyProductId == 0xc57D000000000000000000000000000000000001)  {
      return 0;
    }

    //"name": "BlockFi",
    //"site": "https://blockfi.com/",
    //"type": "custodian",
    //"dateAdded": "2020-12-02",
    //"logo": "blockFi.svg"
    if (legacyProductId == 0xC57D000000000000000000000000000000000002)  {
      return 0;
    }

    //"name": "Nexo",
    //"site": "https://nexo.io/",
    //"type": "custodian",
    //"dateAdded": "2020-12-02",
    //"logo": "nexo.svg"
    if (legacyProductId == 0xC57d000000000000000000000000000000000003)  {
      return 0;
    }

    //"name": "inLock",
    //"site": "https://inlock.io/",
    //"type": "custodian",
    //"dateAdded": "2020-12-02",
    //"logo": "inlock.png"
    if (legacyProductId == 0xc57d000000000000000000000000000000000004)  {
      return 0;
    }

    //"name": "Ledn",
    //"site": "https://ledn.io/",
    //"type": "custodian",
    //"dateAdded": "2020-12-02",
    //"logo": "ledn.svg"
    if (legacyProductId == 0xC57D000000000000000000000000000000000005)  {
      return 0;
    }

    //"name": "Hodlnaut",
    //"site": "https://www.hodlnaut.com/",
    //"type": "custodian",
    //"dateAdded": "2020-12-02",
    //"logo": "hodlnaut.svg"
    if (legacyProductId == 0xC57d000000000000000000000000000000000006)  {
      return 0;
    }

    //"name": "Binance",
    //"site": "https://binance.com/",
    //"type": "custodian",
    //"dateAdded": "2021-01-12",
    //"logo": "binance.png"
    if (legacyProductId == 0xC57d000000000000000000000000000000000007)  {
      return 0;
    }

    //"name": "Coinbase",
    //"site": "https://coinbase.com/",
    //"type": "custodian",
    //"dateAdded": "2021-01-12",
    //"logo": "coinbase.png"
    if (legacyProductId == 0xc57D000000000000000000000000000000000008)  {
      return 0;
    }

    //"name": "Kraken",
    //"site": "https://kraken.com/",
    //"type": "custodian",
    //"dateAdded": "2021-01-12",
    //"logo": "kraken.png"
    if (legacyProductId == 0xc57d000000000000000000000000000000000009)  {
      return 0;
    }

    //"name": "Gemini",
    //"site": "https://gemini.com/",
    //"type": "custodian",
    //"dateAdded": "2021-01-12",
    //"logo": "gemini.png"
    if (legacyProductId == 0xc57d000000000000000000000000000000000010)  {
      return 0;
    }

    //"name": "FTX",
    //"site": "https://ftx.com/",
    //"type": "custodian",
    //"note": "Includes Blockfolio, re-branded as FTX app, where assets are custodied with FTX.",
    //"dateAdded": "2021-05-04",
    //"logo": "ftx.svg"
    if (legacyProductId == 0xC57d000000000000000000000000000000000011)  {
      return 0;
    }

    //"name": "Crypto.com",
    //"site": "https://crypto.com/",
    //"type": "custodian",
    //"note": "Custodial services only, including Crypto Earn, Crypto Credit and Exchange. All non-custodial services such as DeFi Wallet, DeFi Earn and DeFi Swap are excluded.",
    //"dateAdded": "2021-07-06",
    //"logo": "crypto-com.svg"
    if (legacyProductId == 0xC57d000000000000000000000000000000000012)  {
      return 0;
    }

    //"name": "Yield.app",
    //"site": "https://www.yield.app/",
    //"type": "custodian",
    //"dateAdded": "2021-07-06",
    //"logo": "yield-app.png"
    if (legacyProductId == 0xc57d000000000000000000000000000000000013)  {
      return 0;
    }

    //"name": "Pangolin",
    //"site": "https://pangolin.exchange/",
    //"github": "https://github.com/pangolindex",
    //"supportedChains": ["avalanche"],
    //"type": "protocol",
    //"dateAdded": "2021-10-12",
    //"logo": "pangolin.svg"
    if (legacyProductId == 0xefa94DE7a4656D787667C749f7E1223D71E9FD88)  {
      return 0;
    }

    //"name": "Centrifuge Tinlake",
    //"site": "https://tinlake.centrifuge.io/",
    //"github": "https://github.com/centrifuge/",
    //"supportedChains": ["ethereum"],
    //"type": "protocol",
    //"dateAdded": "2021-10-12",
    //"logo": "centrifuge.svg"
    if (legacyProductId == 0x0CED6166873038Ac0cc688e7E6d19E2cBE251Bf0)  {
      return 0;
    }

    //"name": "Rari Capital",
    //"site": "https://rari.capital/",
    //"github": "https://github.com/Rari-Capital",
    //"supportedChains": ["ethereum"],
    //"type": "protocol",
    //"dateAdded": "2021-10-12",
    //"logo": "rari.png"
    if (legacyProductId == 0x835482FE0532f169024d5E9410199369aAD5C77E)  {
      return 0;
    }

    //"name": "Anchor",
    //"site": "https://anchorprotocol.com ",
    //"supportedChains": ["ethereum", "terra"],
    //"type": "protocol",
    //"dateAdded": "2021-04-26",
    //"note": "Includes Ethereum bridge components. Doesn't cover UST depegging.",
    //"logo": "anchor.svg"
    if (legacyProductId == 0x0000000000000000000000000000000000000001)  {
      return 0;
    }

    //"name": "Bunny",
    //"site": "https://pancakebunny.finance/pool",
    //"supportedChains": ["bsc"],
    //"type": "protocol",
    //"dateAdded": "2021-04-26",
    //"logo": "bunnypancake.svg"
    if (legacyProductId == 0x0000000000000000000000000000000000000002)  {
      return 0;
    }

    //"name": "Venus",
    //"site": "https://venus.io",
    //"supportedChains": ["bsc"],
    //"type": "protocol",
    //"dateAdded": "2021-04-26",
    //"logo": "venus.svg"
    if (legacyProductId == 0x0000000000000000000000000000000000000003)  {
      return 0;
    }

    //"name": "Thorchain",
    //"site": "https://thorchain.org",
    //"supportedChains": ["thorchain", "ethereum"],
    //"type": "protocol",
    //"dateAdded": "2021-04-26",
    //"note": "Includes Bitcoin and other chain integrations.",
    //"logo": "thorchain.svg"
    if (legacyProductId == 0x0000000000000000000000000000000000000004)  {
      return 0;
    }

    //"name": "Pancakeswap V1",
    //"site": "https://pancakeswap.finance ",
    //"supportedChains": ["bsc"],
    //"type": "protocol",
    //"dateAdded": "2021-04-26",
    //"logo": "pancakeswap.svg"
    if (legacyProductId == 0x0000000000000000000000000000000000000005)  {
      return 0;
    }

    //"name": "Yearn yvDAI v2",
    //"site": "https://yearn.finance",
    //"supportedChains": ["ethereum"],
    //"type": "token",
    //"symbol": "yvDAI",
    //"coveredToken": "0x19D3364A399d251E894aC732651be8B0E4e85001",
    //"underlyingToken": "DAI",
    //"dateAdded": "2021-05-25",
    //"logo": "yearn.svg"
    if (legacyProductId == 0x0000000000000000000000000000000000000006)  {
      return 0;
    }

    //"name": "Yearn yvUSDC v2",
    //"site": "https://yearn.finance",
    //"supportedChains": ["ethereum"],
    //"type": "token",
    //"symbol": "yvUSDC",
    //"coveredToken": "0x5f18C75AbDAe578b483E5F43f12a39cF75b973a9",
    //"underlyingToken": "DAI",
    //"dateAdded": "2021-05-25",
    //"logo": "yearn.svg"
    if (legacyProductId == 0x0000000000000000000000000000000000000007)  {
      return 0;
    }

    //"name": "Yearn ycrvstETH v2",
    //"site": "https://yearn.finance",
    //"supportedChains": ["ethereum"],
    //"type": "token",
    //"symbol": "ycrvstETH",
    //"coveredToken": "0xdCD90C7f6324cfa40d7169ef80b12031770B4325",
    //"underlyingToken": "ETH",
    //"dateAdded": "2021-05-25",
    //"logo": "yearn.svg"
    if (legacyProductId == 0x0000000000000000000000000000000000000008)  {
      return 0;
    }

    //"name": "Curve 3pool LP (3CRV)",
    //"site": "https://curve.fi/",
    //"supportedChains": ["ethereum"],
    //"type": "token",
    //"symbol": "3CRV",
    //"coveredToken": "0x6c3f90f043a72fa612cbac8115ee7e52bde6e490",
    //"underlyingToken": "DAI",
    //"dateAdded": "2021-05-25",
    //"logo": "curve-3crv.png"
    if (legacyProductId == 0x0000000000000000000000000000000000000009)  {
      return 0;
    }


    //"name": "Curve sETH LP (eCRV)",
    //"site": "https://curve.fi/",
    //"supportedChains": ["ethereum"],
    //"type": "token",
    //"symbol": "eCRV",
    //"coveredToken": "0xA3D87FffcE63B53E0d54fAa1cc983B7eB0b74A9c",
    //"underlyingToken": "ETH",
    //"dateAdded": "2021-05-25",
    //"logo": "curve.png"
    if (legacyProductId == 0x0000000000000000000000000000000000000010)  {
      return 0;
    }

    //"name": "Idle DAI v4 (idleDAIYield)",
    //"site": "https://idle.finance/",
    //"supportedChains": ["ethereum"],
    //"type": "token",
    //"symbol": "idleDAIYield",
    //"coveredToken": "0x3fE7940616e5Bc47b0775a0dccf6237893353bB4",
    //"underlyingToken": "DAI",
    //"dateAdded": "2021-07-05",
    //"logo": "idleDAIYield.svg"
    if (legacyProductId == 0x0000000000000000000000000000000000000011)  {
      return 0;
    }

    //"name": "Idle USDT v4 (idleUSDTYield)",
    //"site": "https://idle.finance/",
    //"supportedChains": ["ethereum"],
    //"type": "token",
    //"symbol": "idleUSDTYield",
    //"coveredToken": "0xF34842d05A1c888Ca02769A633DF37177415C2f8",
    //"underlyingToken": "DAI",
    //"dateAdded": "2021-07-05",
    //"logo": "idleUSDTYield.svg"
    if (legacyProductId == 0x0000000000000000000000000000000000000012)  {
      return 0;
    }
  }
}