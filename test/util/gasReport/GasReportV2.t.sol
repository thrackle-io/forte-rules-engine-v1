// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "test/util/gasReport/GasHelpers.sol";
import "test/client/token/ERC721/util/ERC721Util.sol";
import "test/util/RuleCreation.sol";

/**
 * @dev Please note that these gas tests are structured to simulate through a local test, an on chain environment of an ERC20 token transfer with the Forte Rules Engine connected. 
 */


contract GasReportsV2 is RuleCreation, GasHelpers, ERC721Util {

    uint256 gasUsed;

    UtilApplicationERC20 public applicationCoin3;
    UtilApplicationERC20 public applicationCoin4;
    UtilApplicationERC20 public applicationCoin5;

    HandlerDiamond public applicationCoinHandler3;
    HandlerDiamond public applicationCoinHandler4;
    HandlerDiamond public applicationCoinHandler5;
    HandlerDiamond public applicationERC20HandlerLegacy;
    function setUp() public {
        vm.warp(Blocktime);
        setUpProtocolAndAppManager();
        switchToAppAdministrator();
        oracleApproved = _createOracleApproved();
        oracleDenied = _createOracleDenied();

        // Token 1 Rules engine integrated, no rules enabled
        (applicationCoin, applicationCoinHandler) = deployAndSetupERC20("FRANK", "FRK"); 
        switchToAppAdministrator();
        applicationCoin.mint(appAdministrator, 10 * ATTO);

        // Token 2 Min Transaction Size rule enabled
        (applicationCoin2, applicationCoinHandler2) = deployAndSetupERC20("FRANK", "FRK"); 
        _applyMinTxSizeSetUp(address(applicationCoinHandler2));
        switchToAppAdministrator();
        applicationCoin2.mint(appAdministrator, 10 * ATTO);

        // Token 3 Oracle Deny List rule enabled
        (applicationCoin3, applicationCoinHandler3) = deployAndSetupERC20("FRANK", "FRK"); 
        _applyAccountApproveDenyOracleAciveSetUp(address(applicationCoinHandler3));
        switchToAppAdministrator();
        applicationCoin3.mint(appAdministrator, 10 * ATTO);


        // Token 4 Both Min Tx+Oracle
        (applicationCoin4, applicationCoinHandler4) = deployAndSetupERC20("FRANK", "FRK"); 
        _applyAccountApproveDenyOracleAciveSetUp(address(applicationCoinHandler4));
        _applyMinTxSizeSetUp(address(applicationCoinHandler4));
        switchToAppAdministrator();
        applicationCoin4.mint(appAdministrator, 10 * ATTO);


        // Token 5 Min Tx + Max Tx + Oracle (3 rules)
        (applicationCoin5, applicationCoinHandler5) = deployAndSetupERC20("FRANK", "FRK"); 
        _applyAccountApproveDenyOracleAciveSetUp(address(applicationCoinHandler5));
        _applyAccountMinMaxTokenBalanceSetUp(address(applicationCoinHandler5));
        _applyMinTxSizeSetUp(address(applicationCoinHandler5));
        switchToAppAdministrator();
        applicationCoin5.mint(appAdministrator, 10 * ATTO);

    }

    function _applyAccountApproveDenyOracleAciveSetUp(address _handler) public {
        uint32 ruleId = createAccountApproveDenyOracleRule(0);
        setAccountApproveDenyOracleRule(address(_handler), ruleId);
        switchToAppAdministrator();
        oracleDenied.addAddressToDeniedList(address(1));
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

    function _applyMinTxSizeSetUp(address handler) public {
        ActionTypes[] memory actionTypes = createActionTypeArray(ActionTypes.P2P_TRANSFER, ActionTypes.SELL, ActionTypes.BUY, ActionTypes.MINT, ActionTypes.BURN);
        uint32[] memory ruleIds = new uint32[](5);
        for (uint256 i = 0; i < ruleIds.length; i++) {
            ruleIds[i] = createTokenMinimumTransactionRule(1);
        }
        setTokenMinimumTransactionRuleFull(address(handler), actionTypes, ruleIds);
    }


/**********  BASELINE Gas Usage **********/
    function testERC20_NoRulesActive_Transfer() public endWithStopPrank {
        _erc20TransferGasReport("ERC20_NoRulesActive_Transfer", address(applicationCoin));
    }

/**********  Token Min Tx Size Gas Usage **********/
    function testERC20_TokenMinTxSize_Transfer() public endWithStopPrank {
        _erc20TransferGasReport("ERC20_TokenMinTxSize_Transfer", address(applicationCoin2));
    }

/**********  Approve Deny Oracle Gas Usage **********/
    function testERC20_ApproveDenyOracleActive_Transfer() public endWithStopPrank {
        _erc20TransferGasReport("ERC20_ApproveDenyOracleAcive_Transfer", address(applicationCoin3));
    }

/**********  Approve Deny Oracle Gas Usage **********/
    function testNewOFACplusMinTransfer() public endWithStopPrank {
        _erc20TransferGasReport("ERC20_TokenMinTxSize_OracleRule_Transfer", address(applicationCoin4));
    }

/**********  Oracle MinMaxBalance and MinTransfer **********/
    function testNewOFACPlusMinTransferPlusMinMaxBalance() public endWithStopPrank {
        _erc20TransferGasReport("ERC20_TokenMinTxSize_OracleRule_MinMax_Transfer", address(applicationCoin5));
    }

/**********  Rule Setup Helpers **********/
    function _erc20TransferGasReport(string memory _label, address coin) public {
        startMeasuringGas(_label);
        UtilApplicationERC20(address(coin)).transfer(user1, 1);
        gasUsed = stopMeasuringGas();
        console.log(_label, gasUsed);
    }



}
