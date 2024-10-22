// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.24;

import {IHandlerDiamondErrors, IZeroAddressError} from "src/common/IErrors.sol";
import "src/client/token/handler/common/AppAdministratorOrOwnerOnlyDiamondVersion.sol";
import "src/client/token/handler/diamond/FacetsCommonImports.sol";
import "src/client/application/IAppManager.sol";
import "src/client/token/handler/ruleContracts/HandlerAccountApproveDenyOracle.sol";
import "src/client/token/handler/ruleContracts/HandlerAccountApproveDenyOracleFlexible.sol";
import "src/client/token/ERC20/IERC20Decimals.sol";

import "forge-std/console.sol";

contract OracleRulesFacet is HandlerUtils, AppAdministratorOrOwnerOnlyDiamondVersion, HandlerAccountApproveDenyOracle, HandlerAccountApproveDenyOracleFlexible, IZeroAddressError, IHandlerDiamondErrors {
   

/**
     * @dev Function to check the Account Approve Deny Oracle Rules 
     * @param _from address of the from account
     * @param _to address of the to account
     * @param _sender address of the sender account
     * @param action if selling or buying (of ActionTypes type)
     * @param handlerBase address of the handler proxy
     */
    function checkAccountApproveDenyOraclesRules(address _from, address _to, address _sender, ActionTypes action, address handlerBase) external view onlyOwner {
        _checkAccountApproveDenyOraclesRule(_from, _to, _sender, action, handlerBase);
        _checkAccountApproveDenyOraclesFlexibleRule(_from, _to, action, handlerBase);
    }

   /**
     * @dev Internal function to check the Account Approve Deny Oracle Flexible Rules
     * @param _from address of the from account
     * @param _to address of the to account
     * @param action if selling or buying (of ActionTypes type)
     * @param handlerBase address of the handler proxy
     */
    function _checkAccountApproveDenyOraclesFlexibleRule(address _from, address _to, ActionTypes action, address handlerBase) internal view {
        mapping(ActionTypes => Rule[]) storage accountApproveDenyOracleFlexible = lib.accountApproveDenyOracleFlexibleStorage().accountApproveDenyOracleFlexible;
        IRuleProcessor(handlerBase).checkAccountApproveDenyOraclesFlexible(accountApproveDenyOracleFlexible[action], _to, _from);
    }

    /**
     * @dev Internal function to check the Account Approve Deny Oracle Rules 
     * @param _from address of the from account
     * @param _to address of the to account
     * @param _sender address of the caller 
     * @param action if selling or buying (of ActionTypes type)
     * @param handlerBase address of the handler proxy
     */
    function _checkAccountApproveDenyOraclesRule(address _from, address _to, address _sender, ActionTypes action, address handlerBase) internal view {
        mapping(ActionTypes => Rule[]) storage accountApproveDenyOracle = lib.accountApproveDenyOracleStorage().accountApproveDenyOracle;
        /// The action type determines if the _to or _from is checked by the oracle
        /// _from address is checked for Burn
        if (action == ActionTypes.BURN){
            IRuleProcessor(handlerBase).checkAccountApproveDenyOracles(accountApproveDenyOracle[action], _from);
        } else if (action == ActionTypes.MINT){
            /// _to address is checked  for Mint
            IRuleProcessor(handlerBase).checkAccountApproveDenyOracles(accountApproveDenyOracle[action], _to);
        } else if (action == ActionTypes.P2P_TRANSFER){
            /// _from and _to address are checked for BUY, SELL, and P2P_TRANSFER
            IRuleProcessor(handlerBase).checkAccountApproveDenyOracles(accountApproveDenyOracle[action], _from);
            IRuleProcessor(handlerBase).checkAccountApproveDenyOracles(accountApproveDenyOracle[action], _to);
        } else if (action == ActionTypes.BUY){
            if (_from != _sender){ /// non custodial buy 
                IRuleProcessor(handlerBase).checkAccountApproveDenyOracles(accountApproveDenyOracle[ActionTypes.SELL], _from);
                IRuleProcessor(handlerBase).checkAccountApproveDenyOracles(accountApproveDenyOracle[action], _to);
            } else { /// custodial buy 
                IRuleProcessor(handlerBase).checkAccountApproveDenyOracles(accountApproveDenyOracle[action], _from);
                IRuleProcessor(handlerBase).checkAccountApproveDenyOracles(accountApproveDenyOracle[action], _to);
            }
        } else if (action == ActionTypes.SELL){
            if (_to != _sender){ /// non custodial sell 
                IRuleProcessor(handlerBase).checkAccountApproveDenyOracles(accountApproveDenyOracle[action], _from);
                IRuleProcessor(handlerBase).checkAccountApproveDenyOracles(accountApproveDenyOracle[ActionTypes.BUY], _to);
            } else { /// custodial sell 
                IRuleProcessor(handlerBase).checkAccountApproveDenyOracles(accountApproveDenyOracle[action], _from);
                IRuleProcessor(handlerBase).checkAccountApproveDenyOracles(accountApproveDenyOracle[action], _to);
            }
        }
    }


}
