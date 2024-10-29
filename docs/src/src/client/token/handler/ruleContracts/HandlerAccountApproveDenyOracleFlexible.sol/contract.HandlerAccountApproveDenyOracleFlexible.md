# HandlerAccountApproveDenyOracleFlexible
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/5026b0b8ff56953bd0f2675bfc42f5fa45097500/src/client/token/handler/ruleContracts/HandlerAccountApproveDenyOracleFlexible.sol)

**Inherits:**
[RuleAdministratorOnly](/src/protocol/economic/RuleAdministratorOnly.sol/contract.RuleAdministratorOnly.md), [ActionTypesArray](/src/client/common/ActionTypesArray.sol/contract.ActionTypesArray.md), [ITokenHandlerEvents](/src/common/IEvents.sol/interface.ITokenHandlerEvents.md), [IAssetHandlerErrors](/src/common/IErrors.sol/interface.IAssetHandlerErrors.md)

**Author:**
@ShaneDuncan602 @oscarsernarosero @TJ-Everett

*Setters and getters for the rule in the handler. Meant to be inherited by a handler
facet to easily support the rule.*


## Functions
### setAccountApproveDenyOracleFlexibleId

Rule Setters and Getters

that setting a rule will automatically activate it.

*Set the AccountApproveDenyOracleFlexible. Restricted to rule administrators only.*


```solidity
function setAccountApproveDenyOracleFlexibleId(ActionTypes[] calldata _actions, uint32 _ruleId)
    external
    ruleAdministratorOnly(lib.handlerBaseStorage().appManager);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_actions`|`ActionTypes[]`|the action types|
|`_ruleId`|`uint32`|Rule Id to set|


### setAccountApproveDenyOracleFlexibleIdFull

that setting a rule will automatically activate it.

This function does not check that the array length is greater than zero to allow for clearing out of the action types data

*Set the AccountApproveDenyOracleFlexible suite. This function works differently since the rule allows multiples per action. The actions are repeated to account for multiple oracle rules per action. Restricted to rule administrators only.*


```solidity
function setAccountApproveDenyOracleFlexibleIdFull(ActionTypes[] calldata _actions, uint32[] calldata _ruleIds)
    external
    ruleAdministratorOnly(lib.handlerBaseStorage().appManager);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_actions`|`ActionTypes[]`|actions to have the rule applied to|
|`_ruleIds`|`uint32[]`|Rule Id corresponding to the actions|


### clearAccountApproveDenyOracleFlexible

*Clear the rule data structure*


```solidity
function clearAccountApproveDenyOracleFlexible() internal;
```

### setAccountApproveDenyOracleFlexibleIdUpdate

that setting a rule will automatically activate it.

*Set the AccountApproveDenyOracleFlexible.*


```solidity
function setAccountApproveDenyOracleFlexibleIdUpdate(ActionTypes _action, uint32 _ruleId) internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_action`|`ActionTypes`|the action type to set the rule|
|`_ruleId`|`uint32`|Rule Id to set|


### _doesAccountApproveDenyOracleFlexibleIdExist

*Check to see if the oracle rule already exists in the array. If it does, return the index*


```solidity
function _doesAccountApproveDenyOracleFlexibleIdExist(ActionTypes _action, uint32 _ruleId)
    internal
    view
    returns (uint256 _index, bool _found);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_action`|`ActionTypes`|the corresponding action|
|`_ruleId`|`uint32`|the rule's identifier|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`_index`|`uint256`|the index of the found oracle rule|
|`_found`|`bool`|true if found|


### activateAccountApproveDenyOracleFlexible

*enable/disable rule. Disabling a rule will save gas on transfer transactions.*


```solidity
function activateAccountApproveDenyOracleFlexible(ActionTypes[] calldata _actions, bool _on, uint32 ruleId)
    external
    ruleAdministratorOnly(lib.handlerBaseStorage().appManager);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_actions`|`ActionTypes[]`|the action types|
|`_on`|`bool`|boolean representing if a rule must be checked or not.|
|`ruleId`|`uint32`|the id of the rule to activate/deactivate|


### getAccountApproveDenyOracleFlexibleIds

*Retrieve the account approve deny oracle flexible rule id*


```solidity
function getAccountApproveDenyOracleFlexibleIds(ActionTypes _action) external view returns (uint32[] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_action`|`ActionTypes`|the action type|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint32[]`|oracleRuleId|


### isAccountApproveDenyOracleFlexibleActive

*Tells you if the Accont Approve Deny Oracle Flexible Rule is active or not.*


```solidity
function isAccountApproveDenyOracleFlexibleActive(ActionTypes _action, uint32 ruleId) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_action`|`ActionTypes`|the action type|
|`ruleId`|`uint32`|the id of the rule to check|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|boolean representing if the rule is active|


### removeAccountApproveDenyOracleFlexible

*Removes an account approve deny oracle flexible rule from the list.*


```solidity
function removeAccountApproveDenyOracleFlexible(ActionTypes[] calldata _actions, uint32 ruleId)
    external
    ruleAdministratorOnly(lib.handlerBaseStorage().appManager);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_actions`|`ActionTypes[]`|the action types|
|`ruleId`|`uint32`|the id of the rule to remove|


