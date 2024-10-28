// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "test/util/gasReport/GasHelpers.sol";
import "test/client/token/ERC721/util/ERC721Util.sol";
import "test/util/RuleCreation.sol";

contract GasReports is RuleCreation, GasHelpers, ERC721Util {

    uint256 gasUsed;
    HandlerDiamond public applicationNFTHandlerLegacy;
    HandlerDiamond public applicationERC20HandlerLegacy;
    function setUp() public {
        vm.warp(Blocktime);
        setUpProtocolAndAppManagerAndTokensWithERC721HandlerDiamond();
        (minimalNFTLegacySell, applicationNFTHandlerLegacy) = deployAndSetupERC721MinLegacySell("FRANKENSTEINLegacy", "FRKL");
        (minimalERC20LegacySell, applicationERC20HandlerLegacy) = deployAndSetupERC20MinLegacySell("DRACULALegacy", "DRCL");
    }


/**********  BASELINE Gas Usage **********/

    function testERC20_NoRulesActive_Mint() public endWithStopPrank {
        _erc20MintGasReportPrep();
        _erc20MintGasReport("ERC20_NoRulesActive_Mint");   
    }

    function testERC20_NoRulesActive_Burn() public endWithStopPrank {
        _erc20BurnGasReportPrep();
        _erc20BurnGasReport("ERC20_NoRulesActive_Burn");     
    }

    function testERC20_NoRulesActive_Transfer() public endWithStopPrank {
        _erc20TransferGasReportPrep();
        _erc20TransferGasReport("ERC20_NoRulesActive_Transfer");
    }

    function testERC20_NoRulesActive_Sell() public endWithStopPrank {
        _erc20SellGasReportPrep();
        _erc20SellGasReport("ERC20_NoRulesActive_Sell");
    }

    function testERC721_NoRulesActive_Sell() public endWithStopPrank {
        _erc721SellGasReportPrep();
        _erc721SellGasReport("ERC721_NoRulesActive_Sell");
    }

    function testERC721_NoRulesActive_TransferFrom() public endWithStopPrank {
        _erc721TransferFromGasReportPrep();
        _erc721TransferFromGasReport("ERC721_NoRulesActive_TransferFrom");
    }

    function testERC721_NoRulesActive_Burn() public endWithStopPrank {
        _erc721BurnGasReportPrep();
        _erc721BurnGasReport("ERC721_NoRulesActive_Burn");
    }

    function testERC721_NoRulesActive_SafeMint() public endWithStopPrank {
        _erc721SafeMintGasReportPrep();
        _erc721SafeMintGasReport("ERC721_NoRulesActive_SafeMint");
    }

/**********  Approve Deny Oracle Gas Usage **********/

    function testERC20_ApproveDenyOracleActive_Mint() public endWithStopPrank {
        _applyAccountApproveDenyOracleAciveSetUp(address(applicationCoinHandler));
        _erc20MintGasReportPrep();
        _erc20MintGasReport("ERC20_ApproveDenyOracleAcive_Mint");       
    }

    function testERC20_ApproveDenyOracleActive_Burn() public endWithStopPrank {
        _applyAccountApproveDenyOracleAciveSetUp(address(applicationCoinHandler));
        _erc20BurnGasReportPrep();  
        _erc20BurnGasReport("ERC20_ApproveDenyOracleAcive_Burn");       
    }

    function testERC20_ApproveDenyOracleActive_Transfer() public endWithStopPrank {
        _applyAccountApproveDenyOracleAciveSetUp(address(applicationCoinHandler));
        _erc20TransferGasReportPrep();
        _erc20TransferGasReport("ERC20_ApproveDenyOracleAcive_Transfer");
    }

    function testERC721_ApproveDenyOracleActive_TransferFrom() public endWithStopPrank {
        _applyAccountApproveDenyOracleAciveSetUp(address(applicationNFTHandler));
        _erc721TransferFromGasReportPrep();
        _erc721TransferFromGasReport("ERC721_ApproveDenyOracleAcive_TransferFrom");
    }

    function testERC721_ApproveDenyOracleActive_Burn() public endWithStopPrank {
        _applyAccountApproveDenyOracleAciveSetUp(address(applicationNFTHandler));
        _erc721BurnGasReportPrep();
        _erc721BurnGasReport("ERC721_ApproveDenyOracleAcive_Burn");
    }

    function testERC721_ApproveDenyOracleActive_SafeMint() public endWithStopPrank {
        _applyAccountApproveDenyOracleAciveSetUp(address(applicationNFTHandler));
        _erc721SafeMintGasReportPrep();
        _erc721SafeMintGasReport("ERC721_ApproveDenyOracleActive_SafeMint");
    }

/**********  Account Deny For No Access Level Gas Usage **********/

    function testERC20_AccountDenyForNoAccessLevel_Mint() public endWithStopPrank {
        _applyAccountDenyForNoAccessLevelSetUp();
        _erc20MintGasReportPrep();
        _erc20MintGasReport("ERC20_AccountDenyForNoAccessLevel_Mint");         
    }

    function testERC20_AccountDenyForNoAccessLevel_Burn() public endWithStopPrank {
        _applyAccountDenyForNoAccessLevelSetUp();
        _erc20BurnGasReportPrep();
        _erc20BurnGasReport("ERC20_AccountDenyForNoAccessLevel_Burn");         
    }

    function testERC20_AccountDenyForNoAccessLevel_Transfer() public endWithStopPrank {
        _applyAccountDenyForNoAccessLevelSetUp();
        _erc20TransferGasReportPrep();
        _erc20TransferGasReport("ERC20_AccountDenyForNoAccessLevel_Transfer");
    }

    function testERC721_AccountDenyForNoAccessLevel_TransferFrom() public endWithStopPrank {
        _applyAccountDenyForNoAccessLevelSetUp();
        _erc721TransferFromGasReportPrep();
        _erc721TransferFromGasReport("ERC721_AccountDenyForNoAccessLevel_TransferFrom");
    }

    function testERC721_AccountDenyForNoAccessLevel_Burn() public endWithStopPrank {
        _applyAccountDenyForNoAccessLevelSetUp();
        _erc721BurnGasReportPrep();
        _erc721BurnGasReport("ERC721_AccountDenyForNoAccessLevel_Burn");
    }

    function testERC721_AccountDenyForNoAccessLevel_SafeMint() public endWithStopPrank {
        _applyAccountDenyForNoAccessLevelSetUp();
        _erc721SafeMintGasReportPrep();
        _erc721SafeMintGasReport("ERC721_AccountDenyForNoAccessLevel_SafeMint");
    }

/**********  Account Max Trade Size Gas Usage **********/
    function testERC20_AccountMaxTradeSize_Sell() public endWithStopPrank {
        _applyAccountMaxTradeSizeSetUp(address(applicationERC20HandlerLegacy));
        _erc20SellGasReportPrep();
        _erc20SellGasReport("ERC20_AccountMaxTradeSize_Sell");         
    }

    function testERC20_AccountMaxTradeSize_Transfer() public endWithStopPrank {
        _applyAccountMaxTradeSizeSetUp(address(applicationCoinHandler));
        _erc20TransferGasReportPrep();
        _erc20TransferGasReport("ERC20_AccountMaxTradeSize_Transfer");         
    }

    function testERC721_AccountMaxTradeSize_TransferFrom() public endWithStopPrank {
        _applyAccountMaxTradeSizeSetUp(address(applicationNFTHandlerLegacy));
        _erc721SellGasReportPrep();
        _erc721SellGasReport("ERC721_AccountMaxTradeSize_TransferFrom");
    }

    function testERC721_AccountMaxTradeSize_Burn() public endWithStopPrank {
        _applyAccountMaxTradeSizeSetUp(address(applicationNFTHandler));
        _erc721BurnGasReportPrep();
        _erc721BurnGasReport("ERC721_AccountMaxTradeSize_Burn");         
    }

    function testERC721_AccountMaxTradeSize_SafeMint() public endWithStopPrank {
        _applyAccountMaxTradeSizeSetUp(address(applicationNFTHandler));
        _erc721SafeMintGasReportPrep();
        _erc721SafeMintGasReport("ERC721_AccountMaxTradeSize_SafeMint");         
    }

/**********  Account Max TX Value By Risk Score Gas Usage **********/

    function testERC20_AccountMaxTxValueByRiskScore_Mint() public endWithStopPrank {
        _applyAccountMaxTxValueByRiskScoreSetUp();
        _erc20MintGasReportPrep();
        _erc20MintGasReport("ERC20_AccountMaxTxValueByRiskScore_Mint");         
    }

    function testERC20_AccountMaxTxValueByRiskScore_Burn() public endWithStopPrank {
        _applyAccountMaxTxValueByRiskScoreSetUp();
        _erc20BurnGasReportPrep();
        _erc20BurnGasReport("ERC20_AccountMaxTxValueByRiskScore_Burn");         
    }

    function testERC20_AccountMaxTxValueByRiskScore_Transfer() public endWithStopPrank {
        _applyAccountMaxTxValueByRiskScoreSetUp();
        _erc20TransferGasReportPrep();
        _erc20TransferGasReport("ERC20_AccountMaxTxValueByRiskScore_Transfer");         
    }

    function testERC721_AccountMaxTxValueByRiskScore_TransferFrom() public endWithStopPrank {
        _applyAccountMaxTxValueByRiskScoreSetUp();
        _erc721TransferFromGasReportPrep();
        _erc721TransferFromGasReport("ERC721_AccountMaxTxValueByRiskScore_TransferFrom");         
    }

    function testERC721_AccountMaxTxValueByRiskScore_Burn() public endWithStopPrank {
        _applyAccountMaxTxValueByRiskScoreSetUp();
        _erc721BurnGasReportPrep();
        _erc721BurnGasReport("ERC721_AccountMaxTxValueByRiskScore_Burn");         
    }

    function testERC721_AccountMaxTxValueByRiskScore_SafeMint() public endWithStopPrank {
        _applyAccountMaxTxValueByRiskScoreSetUp();
        _erc721SafeMintGasReportPrep();
        _erc721SafeMintGasReport("ERC721_AccountMaxTxValueByRiskScore_SafeMint");         
    }

/**********  Account Max Value By Access Level Gas Usage **********/

    function testERC20_AccountMaxValueByAccessLevel_Mint() public endWithStopPrank {
        _applyAccountMaxValueByAccessLevelSetUp();
        _erc20MintGasReportPrep();
        _erc20MintGasReport("ERC20_AccountMaxValueByAccessLevel_Mint");         
    }

    function testERC20_AccountMaxValueByAccessLevel_Burn() public endWithStopPrank {
        _applyAccountMaxValueByAccessLevelSetUp();
        _erc20BurnGasReportPrep();
        _erc20BurnGasReport("ERC20_AccountMaxValueByAccessLevel_Burn");         
    }

    function testERC20_AccountMaxValueByAccessLevel_Transfer() public endWithStopPrank {
        _applyAccountMaxValueByAccessLevelSetUp();
        _erc20TransferGasReportPrep();
        _erc20TransferGasReport("ERC20_AccountMaxValueByAccessLevel_Transfer");         
    }

    function testERC721_AccountMaxValueByAccessLevel_TransferFrom() public endWithStopPrank {
        _applyAccountMaxValueByAccessLevelSetUp();
        _erc721TransferFromGasReportPrep();
        _erc721TransferFromGasReport("ERC721_AccountMaxValueByAccessLevel_TransferFrom");         
    }

    function testERC721_AccountMaxValueByAccessLevel_Burn() public endWithStopPrank {
        _applyAccountMaxValueByAccessLevelSetUp();
        _erc721BurnGasReportPrep();
        _erc721BurnGasReport("ERC721_AccountMaxValueByAccessLevel_Burn");         
    }

    function testERC721_AccountMaxValueByAccessLevel_SafeMint() public endWithStopPrank {
        _applyAccountMaxValueByAccessLevelSetUp();
        _erc721SafeMintGasReportPrep();
        _erc721SafeMintGasReport("ERC721_AccountMaxValueByAccessLevel_SafeMint");         
    }

/**********  Account Max Value By Risk Gas Usage **********/

    function testERC20_AccountMaxValueByRisk_Mint() public endWithStopPrank {
        _applyAccountMaxValueByRiskSetUp();
        _erc20MintGasReportPrep();
        _erc20MintGasReport("ERC20_AccountMaxValueByRisk_Mint");         
    }

    function testERC20_AccountMaxValueByRisk_Burn() public endWithStopPrank {
        _applyAccountMaxValueByRiskSetUp();
        _erc20BurnGasReportPrep();
        _erc20BurnGasReport("ERC20_AccountMaxValueByRisk_Burn");         
    }

    function testERC20_AccountMaxValueByRisk_Transfer() public endWithStopPrank {
        _applyAccountMaxValueByRiskSetUp();
        _erc20TransferGasReportPrep();
        _erc20TransferGasReport("ERC20_AccountMaxValueByRisk_Transfer");         
    }

    function testERC721_AccountMaxValueByRisk_TransferFrom() public endWithStopPrank {
        _applyAccountMaxValueByRiskSetUp();
        _erc721TransferFromGasReportPrep();
        _erc721TransferFromGasReport("ERC721_AccountMaxValueByRisk_TransferFrom");         
    }

    function testERC721_AccountMaxValueByRisk_Burn() public endWithStopPrank {
        _applyAccountMaxValueByRiskSetUp();
        _erc721BurnGasReportPrep();
        _erc721BurnGasReport("ERC721_AccountMaxValueByRisk_Burn");       
    }

    function testERC721_AccountMaxValueByRisk_SafeMint() public endWithStopPrank {
        _applyAccountMaxValueByRiskSetUp();
        _erc721SafeMintGasReportPrep();
        _erc721SafeMintGasReport("ERC721_AccountMaxValueByRisk_SafeMint");         
    }

/**********  Account Max Value Out By Access Level Gas Usage **********/

    function testERC20_AccountMaxValueOutByAccessLevel_Mint() public endWithStopPrank {
        _applyAccountMaxValueOutByAccessLevelSetUp();
        _erc20MintGasReportPrep();
        _erc20MintGasReport("ERC20_AccountMaxValueOutByAccessLevel_Mint");         
    }

    function testERC20_AccountMaxValueOutByAccessLevel_Burn() public endWithStopPrank {
        _applyAccountMaxValueOutByAccessLevelSetUp();
        _erc20BurnGasReportPrep();
        _erc20BurnGasReport("ERC20_AccountMaxValueOutByAccessLevel_Burn");         
    }

    function testERC20_AccountMaxValueOutByAccessLevel_Transfer() public endWithStopPrank {
        _applyAccountMaxValueOutByAccessLevelSetUp();
        _erc20TransferGasReportPrep();
        _erc20TransferGasReport("ERC20_AccountMaxValueOutByAccessLevel_Transfer");         
    }

    function testERC721_AccountMaxValueOutByAccessLevel_TransferFrom() public endWithStopPrank {
        _applyAccountMaxValueOutByAccessLevelSetUp();
        _erc721TransferFromGasReportPrep();
        _erc721TransferFromGasReport("ERC721_AccountMaxValueOutByAccessLevel_TransferFrom");         
    }

    function testERC721_AccountMaxValueOutByAccessLevel_Burn() public endWithStopPrank {
        _applyAccountMaxValueOutByAccessLevelSetUp();
        _erc721BurnGasReportPrep();
        _erc721BurnGasReport("ERC721_AccountMaxValueOutByAccessLevel_Burn");         
    }

    function testERC721_AccountMaxValueOutByAccessLevel_SafeMint() public endWithStopPrank {
        _applyAccountMaxValueOutByAccessLevelSetUp();
        _erc721SafeMintGasReportPrep();
        _erc721SafeMintGasReport("ERC721_AccountMaxValueOutByAccessLevel_SafeMint");         
    }

/**********  Account Min Max Token Balance Gas Usage **********/

    function testERC20_AccountMinMaxTokenBalance_Mint() public endWithStopPrank {
        _applyAccountMinMaxTokenBalanceSetUp(address(applicationCoinHandler));
        _erc20MintGasReportPrep();
        _erc20MintGasReport("ERC20_AccountMinMaxTokenBalance_Mint");         
    }

    function testERC20_AccountMinMaxTokenBalance_Burn() public endWithStopPrank {
        _applyAccountMinMaxTokenBalanceSetUp(address(applicationCoinHandler));
        _erc20BurnGasReportPrep();
        _erc20BurnGasReport("ERC20_AccountMinMaxTokenBalance_Burn");         
    }

    function testERC20_AccountMinMaxTokenBalance_Transfer() public endWithStopPrank {
        _applyAccountMinMaxTokenBalanceSetUp(address(applicationCoinHandler));
        _erc20TransferGasReportPrep();
        _erc20TransferGasReport("ERC20_AccountMinMaxTokenBalance_Transfer");         
    }

    function testERC721_AccountMinMaxTokenBalance_TransferFrom() public endWithStopPrank {
        _applyAccountMinMaxTokenBalanceSetUp(address(applicationNFTHandler));
        _erc721TransferFromGasReportPrep();
        _erc721TransferFromGasReport("ERC721_AccountMinMaxTokenBalance_TransferFrom");         
    }

    function testERC721_AccountMinMaxTokenBalance_Burn() public endWithStopPrank {
        _applyAccountMinMaxTokenBalanceSetUp(address(applicationNFTHandler));
        _erc721BurnGasReportPrep();
        _erc721BurnGasReport("ERC721_AccountMinMaxTokenBalance_Burn");         
    }

    function testERC721_AccountMinMaxTokenBalance_SafeMint() public endWithStopPrank {
        _applyAccountMinMaxTokenBalanceSetUp(address(applicationNFTHandler));
        _erc721SafeMintGasReportPrep();
        _erc721SafeMintGasReport("ERC721_AccountMinMaxTokenBalance_SafeMint");         
    }

/**********  Token Max Buy Sell Volume Gas Usage **********/

    function testERC20_TokenMaxBuySellVolume_Sell() public endWithStopPrank {
        _applyTokenMaxBuySellVolumeSetUp(address(applicationERC20HandlerLegacy));
        _erc20SellGasReportPrep();
        _erc20SellGasReport("ERC20_TokenMaxBuySellVolume_Sell");         
    }

    function testERC20_TokenMaxBuySellVolume_Burn() public endWithStopPrank {
        _applyTokenMaxBuySellVolumeSetUp(address(applicationCoinHandler));
        _erc20BurnGasReportPrep();
        _erc20BurnGasReport("ERC20_TokenMaxBuySellVolume_Burn");         
    }

    function testERC20_TokenMaxBuySellVolume_Transfer() public endWithStopPrank {
        _applyTokenMaxBuySellVolumeSetUp(address(applicationCoinHandler));
        _erc20TransferGasReportPrep();
        _erc20TransferGasReport("ERC20_TokenMaxBuySellVolume_Transfer");         
    }

    function testERC721_TokenMaxBuySellVolume_TransferFrom() public endWithStopPrank {
        _applyTokenMaxBuySellVolumeSetUp(address(applicationNFTHandlerLegacy));
        _erc721SellGasReportPrep();
        _erc721SellGasReport("ERC721_TokenMaxBuySellVolume_TransferFrom");
    }

    function testERC721_TokenMaxBuySellVolume_Burn() public endWithStopPrank {
        _applyTokenMaxBuySellVolumeSetUp(address(applicationNFTHandler));
        _erc721BurnGasReportPrep();
        _erc721BurnGasReport("ERC721_TokenMaxBuySellVolume_Burn");         
    }

    function testERC721_TokenMaxBuySellVolume_SafeMint() public endWithStopPrank {
        _applyTokenMaxBuySellVolumeSetUp(address(applicationNFTHandler));
        _erc721SafeMintGasReportPrep();
        _erc721SafeMintGasReport("ERC721_TokenMaxBuySellVolume_SafeMint");         
    }

/**********  Token Max Daily Trades Gas Usage **********/

    function testERC721_TokenMaxDailyTrades_TransferFrom() public endWithStopPrank {
        _applyTokenMaxDailyTradesSetUp();
        _erc721TransferFromGasReportPrep();
        _erc721TransferFromGasReport("ERC721_TokenMaxDailyTrades_TransferFrom");         
    }

    function testERC721_TokenMaxDailyTrades_SafeMint() public endWithStopPrank {
        _applyTokenMaxDailyTradesSetUp();
        _erc721SafeMintGasReportPrep();
        _erc721SafeMintGasReport("ERC721_TokenMaxDailyTrades_SafeMint");
    }

/**********  Token Max Supply Volatility Gas Usage **********/

    function testERC20_TokenMaxSupplyVolatility_Mint() public endWithStopPrank {
        _applyTokenMaxSupplyVolatilitySetUp(address(applicationCoinHandler));
        _erc20MintGasReportPrep();
        _erc20MintGasReport("ERC20_TokenMaxSupplyVolatility_Mint");
    }

    function testERC20_TokenMaxSupplyVolatility_Burn() public endWithStopPrank {
        _applyTokenMaxSupplyVolatilitySetUp(address(applicationCoinHandler));
        _erc20BurnGasReportPrep();
        _erc20BurnGasReport("ERC20_TokenMaxSupplyVolatility_Burn");
    }

    function testERC20_TokenMaxSupplyVolatility_Transfer() public endWithStopPrank {
        _applyTokenMaxSupplyVolatilitySetUp(address(applicationCoinHandler));
        _erc20TransferGasReportPrep();
        _erc20TransferGasReport("ERC20_TokenMaxSupplyVolatility_Transfer");
    }

    function testERC721_TokenMaxSupplyVolatility_TransferFrom() public endWithStopPrank {
        _applyTokenMaxSupplyVolatilitySetUp(address(applicationNFTHandler));
        _erc721TransferFromGasReportPrep();
        _erc721TransferFromGasReport("ERC721_TokenMaxSupplyVolatility_TransferFrom");
    }

    function testERC721_TokenMaxSupplyVolatility_Burn() public endWithStopPrank {
        _applyTokenMaxSupplyVolatilitySetUp(address(applicationNFTHandler));
        _erc721BurnGasReportPrep();
        _erc721BurnGasReport("ERC721_TokenMaxSupplyVolatility_Burn");
    }

    function testERC721_TokenMaxSupplyVolatility_SafeMint() public endWithStopPrank {
        _applyTokenMaxSupplyVolatilitySetUp(address(applicationNFTHandler));
        _erc721SafeMintGasReportPrep();
        _erc721SafeMintGasReport("ERC721_TokenMaxSupplyVolatility_SafeMint");
    }

/**********  Token Max Trading Volume Gas Usage **********/

    function testERC20_TokenMaxTradingVolume_Mint() public endWithStopPrank {
        _applyTokenMaxTradingVolumeSetUp(address(applicationCoinHandler));
        _erc20MintGasReportPrep();
        _erc20MintGasReport("ERC20_TokenMaxTradingVolume_Mint");
    }

    function testERC20_TokenMaxTradingVolume_Burn() public endWithStopPrank {
        _applyTokenMaxTradingVolumeSetUp(address(applicationCoinHandler));
        _erc20BurnGasReportPrep();
        _erc20BurnGasReport("ERC20_TokenMaxTradingVolume_Burn");
    }

    function testERC20_TokenMaxTradingVolume_Transfer() public endWithStopPrank {
        _applyTokenMaxTradingVolumeSetUp(address(applicationCoinHandler));
        _erc20TransferGasReportPrep();
        _erc20TransferGasReport("ERC20_TokenMaxTradingVolume_Transfer");
    }

    function testERC721_TokenMaxTradingVolume_TransferFrom() public endWithStopPrank {
        _applyTokenMaxTradingVolumeSetUp(address(applicationNFTHandler));
        _erc721TransferFromGasReportPrep();
        _erc721TransferFromGasReport("ERC721_TokenMaxTradingVolume_TransferFrom");
    }

    function testERC721_TokenMaxTradingVolume_Burn() public endWithStopPrank {
        _applyTokenMaxTradingVolumeSetUp(address(applicationNFTHandler));
        _erc721BurnGasReportPrep();
        _erc721BurnGasReport("ERC721_TokenMaxTradingVolume_Burn");
    }

    function testERC721_TokenMaxTradingVolume_SafeMint() public endWithStopPrank {
        _applyTokenMaxTradingVolumeSetUp(address(applicationNFTHandler));
        _erc721SafeMintGasReportPrep();
        _erc721SafeMintGasReport("ERC721_TokenMaxTradingVolume_SafeMint");
    }

/**********  Token Min Hold Time Gas Usage **********/

    function testERC721_TokenMinHoldTime_TransferFrom() public endWithStopPrank {
        _applyTokenMinHoldTimeSetUp();
        _erc721TransferFromGasReportWithFastForwardPrep();
        _erc721TransferFromGasReportWithFastForward("ERC721_TokenMinHoldTime_TransferFrom");
    }

    function testERC721_TokenMinHoldTime_Burn() public endWithStopPrank {
        _applyTokenMinHoldTimeSetUp();
        _erc721BurnGasReportWithFastForwardPrep();
        _erc721BurnGasReportWithFastForward("ERC721_TokenMinHoldTime_Burn");
    }

    function testERC721_TokenMinHoldTime_SafeMint() public endWithStopPrank {
        _applyTokenMinHoldTimeSetUp();
        _erc721SafeMintGasReportPrep();
        _erc721SafeMintGasReport("ERC721_TokenMinHoldTime_SafeMint");
    }

/**********  Token Min Tx Size Gas Usage **********/

    function testERC20_TokenMinTxSize_Mint() public endWithStopPrank {
        _applyMinTxSizeSetUp();
        _erc20MintGasReportPrep();
        _erc20MintGasReport("ERC20_TokenMinTxSize_Mint");
    }

    function testERC20_TokenMinTxSize_Burn() public endWithStopPrank {
        _applyMinTxSizeSetUp();
        _erc20BurnGasReportPrep();
        _erc20BurnGasReport("ERC20_TokenMinTxSize_Burn");
    }

    function testERC20_TokenMinTxSize_Transfer() public endWithStopPrank {
        _applyMinTxSizeSetUp();
        _erc20TransferGasReportPrep();
        _erc20TransferGasReport("ERC20_TokenMinTxSize_Transfer");
    }


/**********  Rule Setup Helpers **********/
    function _erc20MintGasReport(string memory _label) public {
        switchToAppAdministrator();
        startMeasuringGas(_label);
        applicationCoin.mint(appAdministrator, 1);
        gasUsed = stopMeasuringGas();
        console.log(_label, gasUsed);  
    }

    function _erc20MintGasReportPrep() public {
        switchToAppAdministrator();
        startMeasuringGas("_erc20MintGasReportPrep");
        applicationCoin.mint(appAdministrator, 1);
        gasUsed = stopMeasuringGas();
    }

    function _erc20TransferGasReport(string memory _label) public {
        switchToAppAdministrator();
        applicationCoin.mint(appAdministrator, 1);
        switchToAppAdministrator();

        startMeasuringGas(_label);
        applicationCoin.transfer(user1, 1);
        gasUsed = stopMeasuringGas();
        console.log(_label, gasUsed);
    }

    function _erc20TransferGasReportPrep() public {
        switchToAppAdministrator();
        applicationCoin.mint(appAdministrator, 1);
        switchToAppAdministrator();

        startMeasuringGas("_erc20TransferGasReportPrep");
        applicationCoin.transfer(user1, 1);
        gasUsed = stopMeasuringGas();
    }

    function _erc20SellGasReport(string memory _label) public {
        switchToAppAdministrator();
        minimalERC20LegacySell.mint(appAdministrator,1);
        startMeasuringGas(_label);
        minimalERC20LegacySell.transfer(user1, 1);
        gasUsed = stopMeasuringGas();
        console.log(_label, gasUsed);
    }

    function _erc20SellGasReportPrep() public {
        switchToAppAdministrator();
        minimalERC20LegacySell.mint(appAdministrator,1);
        startMeasuringGas("_erc721SellGasReportPrep");
        minimalERC20LegacySell.transfer(user1, 1);
        gasUsed = stopMeasuringGas();
    }

    function _erc20BurnGasReport(string memory _label) public {
        switchToAppAdministrator();
        applicationCoin.mint(appAdministrator, 1);
        switchToAppAdministrator();

        startMeasuringGas(_label);
        applicationCoin.burn(1);
        gasUsed = stopMeasuringGas();
        console.log(_label, gasUsed); 
    }

    function _erc20BurnGasReportPrep() public {
        switchToAppAdministrator();
        applicationCoin.mint(appAdministrator, 1);

        startMeasuringGas("_erc20BurnGasReportPrep");
        applicationCoin.burn(1);
        gasUsed = stopMeasuringGas();
    }

    function _erc721SafeMintGasReport(string memory _label) public {
        switchToAppAdministrator();

        startMeasuringGas(_label);
        applicationNFT.safeMint(user1);
        gasUsed = stopMeasuringGas();
        console.log(_label, gasUsed);
    }

    function _erc721SafeMintGasReportPrep() public {
        switchToAppAdministrator();
        startMeasuringGas("_erc721SafeMintGasReportPrep");
        applicationNFT.safeMint(user1);
        gasUsed = stopMeasuringGas();
    }

    function _erc721TransferFromGasReport(string memory _label) public {
        switchToAppAdministrator();
        applicationNFT.safeMint(appAdministrator);

        startMeasuringGas(_label);
        applicationNFT.transferFrom(appAdministrator, user1, 1);
        gasUsed = stopMeasuringGas();
        console.log(_label, gasUsed);
    }
    function _erc721TransferFromGasReportPrep() public {
        switchToAppAdministrator();
        applicationNFT.safeMint(appAdministrator);

        startMeasuringGas("_erc721TransferFromGasReportPrep");
        applicationNFT.transferFrom(appAdministrator, user1, 0);
        gasUsed = stopMeasuringGas();
    }

    function _erc721TransferFromGasReportWithFastForwardPrep() public {
        switchToAppAdministrator();
        vm.warp(Blocktime);
        applicationNFT.safeMint(appAdministrator);
        vm.warp(Blocktime + 10000000000000000);

        startMeasuringGas("_erc721TransferFromGasReportPrep");
        applicationNFT.transferFrom(appAdministrator, user1, 0);
        gasUsed = stopMeasuringGas();
    }

    function _erc721TransferFromGasReportWithFastForward(string memory _label) public {
        switchToAppAdministrator();
        vm.warp(Blocktime);
        applicationNFT.safeMint(appAdministrator);
        vm.warp(Blocktime + 10000000000000000);
        startMeasuringGas(_label);
        applicationNFT.transferFrom(appAdministrator, user1, 1);
        gasUsed = stopMeasuringGas();
        console.log(_label, gasUsed);
    }

    function _erc721SellGasReport(string memory _label) public {
        switchToAppAdministrator();
        minimalNFTLegacySell.safeMint(appAdministrator);
        startMeasuringGas(_label);
        minimalNFTLegacySell.transferFrom(appAdministrator, user1, 1);
        gasUsed = stopMeasuringGas();
        console.log(_label, gasUsed);
    }

    function _erc721SellGasReportPrep() public {
        switchToAppAdministrator();
        minimalNFTLegacySell.safeMint(appAdministrator);
        startMeasuringGas("_erc721SellGasReportPrep");
        minimalNFTLegacySell.transferFrom(appAdministrator, user1, 0);
        gasUsed = stopMeasuringGas();
    }

    function _erc721BurnGasReport(string memory _label) public {
        switchToAppAdministrator();
        applicationNFT.safeMint(appAdministrator);

        startMeasuringGas(_label);
        applicationNFT.burn(1);
        gasUsed = stopMeasuringGas();
        console.log(_label, gasUsed);
    }

    function _erc721BurnGasReportPrep() public {
        switchToAppAdministrator();
        applicationNFT.safeMint(appAdministrator);

        startMeasuringGas("_erc721BurnGasReportBurn");
        applicationNFT.burn(0);
        gasUsed = stopMeasuringGas();
    }

    function _erc721BurnGasReportWithFastForwardPrep() public {
        switchToAppAdministrator();
        applicationNFT.safeMint(appAdministrator);
        vm.warp(Blocktime + 10000000000000000);
        startMeasuringGas("_erc721BurnGasReportBurn");
        applicationNFT.burn(0);
        gasUsed = stopMeasuringGas();
    }

    function _erc721BurnGasReportWithFastForward(string memory _label) public {
        switchToAppAdministrator();
        applicationNFT.safeMint(appAdministrator);
        vm.warp(Blocktime + 20000000000000000);
        startMeasuringGas(_label);
        applicationNFT.burn(1);
        gasUsed = stopMeasuringGas();
        console.log(_label, gasUsed);
    }

    function _applyAccountApproveDenyOracleAciveSetUp(address _handler) public {
        uint32 ruleId = createAccountApproveDenyOracleRule(0);
        setAccountApproveDenyOracleRule(address(_handler), ruleId);
        switchToAppAdministrator();
        oracleDenied.addAddressToDeniedList(address(1));
    }


    function _applyAccountDenyForNoAccessLevelSetUp() public {
        ActionTypes[] memory actionTypes = createActionTypeArray(ActionTypes.P2P_TRANSFER, ActionTypes.BUY, ActionTypes.SELL, ActionTypes.MINT);
        createAccountDenyForNoAccessLevelRuleFull(actionTypes);
        switchToAccessLevelAdmin();
        applicationAppManager.addAccessLevel(appAdministrator, 1);
        applicationAppManager.addAccessLevel(user1, 1);
    }

    function _applyAccountMaxTradeSizeSetUp(address _handler) public {
        ActionTypes[] memory actionTypes = createActionTypeArray(ActionTypes.BUY, ActionTypes.SELL);
        uint32 ruleId = createAccountMaxTradeSizeRule("", 100, 100);
        setAccountMaxTradeSizeRule(address(_handler), actionTypes, ruleId);
    }

    function _applyAccountMaxTxValueByRiskScoreSetUp() public {
        uint8[] memory riskScores = createUint8Array(10, 40, 80, 99);
        uint32[] memory ruleIds = new uint32[](4);
        ActionTypes[] memory actionTypes = createActionTypeArray(ActionTypes.BUY, ActionTypes.SELL, ActionTypes.MINT, ActionTypes.P2P_TRANSFER);
        for (uint256 i = 0; i < ruleIds.length; ++i){
            ruleIds[i] = createAccountMaxTxValueByRiskRule(riskScores, createUint48Array(1000000, 100000, 10000, 1000));
        }
        setAccountMaxTxValueByRiskRuleFull(actionTypes, ruleIds);
    }

    function _applyAccountMaxValueByAccessLevelSetUp() public {
        ActionTypes[] memory actionTypes = createActionTypeArray(ActionTypes.BUY, ActionTypes.MINT, ActionTypes.P2P_TRANSFER);
        uint32[] memory ruleIds = new uint32[](3);
        for (uint256 i = 0; i < ruleIds.length; ++i){
            ruleIds[i] = createAccountMaxValueByAccessLevelRule(5, 100, 500, 1000, 10000);
        }
        setAccountMaxValueByAccessLevelRuleFull(actionTypes, ruleIds);
    }

    function _applyAccountMaxValueByRiskSetUp() public {
        uint8[] memory riskScores = createUint8Array(10, 80, 99);
        uint32[] memory ruleIds = new uint32[](3);
        ActionTypes[] memory actionTypes = createActionTypeArray(ActionTypes.BUY, ActionTypes.MINT, ActionTypes.P2P_TRANSFER);
        for (uint256 i = 0; i < ruleIds.length; ++i){
            ruleIds[i] = createAccountMaxValueByRiskRule(riskScores, createUint48Array(10000, 1000, 500));
        }
        setAccountMaxValueByRiskRuleFull(actionTypes, ruleIds);
    }

    function _applyAccountMaxValueOutByAccessLevelSetUp() public {
        ActionTypes[] memory actionTypes = createActionTypeArray(ActionTypes.SELL, ActionTypes.P2P_TRANSFER, ActionTypes.BURN);
        uint32[] memory ruleIds = new uint32[](3);
        for (uint256 i = 0; i < ruleIds.length; ++i){
            ruleIds[i] = createAccountMaxValueOutByAccessLevelRule(10, 100, 1000, 10000, 100000);
        }
        setAccountMaxValueOutByAccessLevelRuleFull(actionTypes, ruleIds);
    }

    function _applyAccountMinMaxTokenBalanceSetUp(address _handler) public {
        ActionTypes[] memory actionTypes = createActionTypeArray(ActionTypes.SELL, ActionTypes.P2P_TRANSFER, ActionTypes.BUY, ActionTypes.MINT, ActionTypes.BURN);
        bytes32[] memory tags = createBytes32Array("");
        uint32[] memory ruleIds = new uint32[](5);
        for (uint256 i = 0; i < ruleIds.length; ++i){
            ruleIds[i] = createAccountMinMaxTokenBalanceRule(createBytes32Array(tags[0]), createUint256Array(0), createUint256Array((i + 1) * 10E30));
        }
        setAccountMinMaxTokenBalanceRuleFull(address(_handler), actionTypes, ruleIds);
    }

    function _applyTokenMaxBuySellVolumeSetUp(address _handler) public {
        ActionTypes[] memory actionTypes = createActionTypeArray(ActionTypes.BUY, ActionTypes.SELL);
        uint32 ruleId = createTokenMaxBuySellVolumeRule(5000, 24, 100_000_000, Blocktime);
        setTokenMaxBuySellVolumeRule(address(_handler), actionTypes, ruleId);
    }

    function _applyTokenMaxDailyTradesSetUp() public {
        ActionTypes[] memory actionTypes = createActionTypeArray(ActionTypes.SELL, ActionTypes.P2P_TRANSFER, ActionTypes.BUY, ActionTypes.MINT);
        bytes32[] memory tags = createBytes32Array("");
        uint32[] memory ruleIds = new uint32[](4);
        for (uint8 i = 0; i < ruleIds.length; ++i){
            ruleIds[i] = createTokenMaxDailyTradesRule(tags[0], i + 1);
        }
        setTokenMaxDailyTradesRuleFull(address(applicationNFTHandler), actionTypes, ruleIds);
    }

    function _applyTokenMaxSupplyVolatilitySetUp(address _handler) public {
        uint32 ruleId = createTokenMaxSupplyVolatilityRule(20000, 24, Blocktime, 0);
        setTokenMaxSupplyVolatilityRule(address(_handler), ruleId);
    }

    function _applyTokenMaxTradingVolumeSetUp(address _handler) public {
        uint32 ruleId = createTokenMaxTradingVolumeRule(4000, 2, Blocktime, 100_000 * ATTO);
        setTokenMaxTradingVolumeRule(address(_handler), ruleId);
    }

    function _applyTokenMinHoldTimeSetUp() public {
        uint32[] memory ruleIds = new uint32[](3);
        ActionTypes[] memory actions = createActionTypeArray(ActionTypes.P2P_TRANSFER, ActionTypes.SELL, ActionTypes.BURN);
        for (uint256 i = 0; i < ruleIds.length; i++) {
            ruleIds[i] = createTokenMinHoldTimeRule(uint16(1));
        }
        setTokenMinHoldTimeRuleFull(address(applicationNFTHandler), actions, ruleIds);
    }

    function _applyMinTxSizeSetUp() public {
        ActionTypes[] memory actionTypes = createActionTypeArray(ActionTypes.P2P_TRANSFER, ActionTypes.SELL, ActionTypes.BUY, ActionTypes.MINT, ActionTypes.BURN);
        uint32[] memory ruleIds = new uint32[](5);
        for (uint256 i = 0; i < ruleIds.length; i++) {
            ruleIds[i] = createTokenMinimumTransactionRule(1);
        }
        setTokenMinimumTransactionRuleFull(address(applicationCoinHandler), actionTypes, ruleIds);
    }
}
