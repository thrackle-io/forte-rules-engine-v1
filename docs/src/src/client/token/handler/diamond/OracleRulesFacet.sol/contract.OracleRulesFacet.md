# OracleRulesFacet
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/9fddf56ef55dac8b5660e8eb459c61d41ab7f720/src/client/token/handler/diamond/OracleRulesFacet.sol)

**Inherits:**
[HandlerUtils](/src/client/token/handler/common/HandlerUtils.sol/contract.HandlerUtils.md), [AppAdministratorOrOwnerOnlyDiamondVersion](/src/client/token/handler/common/AppAdministratorOrOwnerOnlyDiamondVersion.sol/contract.AppAdministratorOrOwnerOnlyDiamondVersion.md), [HandlerAccountApproveDenyOracle](/src/client/token/handler/ruleContracts/HandlerAccountApproveDenyOracle.sol/contract.HandlerAccountApproveDenyOracle.md), [HandlerAccountApproveDenyOracleFlexible](/src/client/token/handler/ruleContracts/HandlerAccountApproveDenyOracleFlexible.sol/contract.HandlerAccountApproveDenyOracleFlexible.md), [IZeroAddressError](/src/common/IErrors.sol/interface.IZeroAddressError.md), [IHandlerDiamondErrors](/src/common/IErrors.sol/interface.IHandlerDiamondErrors.md)


## Functions
### checkAccountApproveDenyOraclesRules

*Function to check the Account Approve Deny Oracle Rules*


```solidity
function checkAccountApproveDenyOraclesRules(
    address _from,
    address _to,
    address _sender,
    ActionTypes action,
    address handlerBase
) external view onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_from`|`address`|address of the from account|
|`_to`|`address`|address of the to account|
|`_sender`|`address`|address of the sender account|
|`action`|`ActionTypes`|if selling or buying (of ActionTypes type)|
|`handlerBase`|`address`|address of the handler proxy|


### _checkAccountApproveDenyOraclesFlexibleRule

*Internal function to check the Account Approve Deny Oracle Flexible Rules*


```solidity
function _checkAccountApproveDenyOraclesFlexibleRule(
    address _from,
    address _to,
    ActionTypes action,
    address handlerBase
) internal view;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_from`|`address`|address of the from account|
|`_to`|`address`|address of the to account|
|`action`|`ActionTypes`|if selling or buying (of ActionTypes type)|
|`handlerBase`|`address`|address of the handler proxy|


### _checkAccountApproveDenyOraclesRule

*Internal function to check the Account Approve Deny Oracle Rules*


```solidity
function _checkAccountApproveDenyOraclesRule(
    address _from,
    address _to,
    address _sender,
    ActionTypes action,
    address handlerBase
) internal view;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_from`|`address`|address of the from account|
|`_to`|`address`|address of the to account|
|`_sender`|`address`|address of the caller|
|`action`|`ActionTypes`|if selling or buying (of ActionTypes type)|
|`handlerBase`|`address`|address of the handler proxy|


