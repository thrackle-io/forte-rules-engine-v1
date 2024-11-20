# VersionFacet
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/82c852aae835019a12c3223cb7eabe7f59f19e1a/src/protocol/diamond/VersionFacet.sol)

**Inherits:**
ERC173

**Author:**
@ShaneDuncan602, @oscarsernarosero, @TJ-Everett

This is a facet that should be deployed for any protocol diamond.

*setter and getter functions for Version of a diamond.*


## Functions
### updateVersion

*Function to update the version of the Rule Processor Diamond*


```solidity
function updateVersion(string memory newVersion) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`newVersion`|`string`|string of the representation of the version in semantic versioning format: --> "MAJOR.MINOR.PATCH".|


### version

*returns the version of the Rule Processor Diamond.*


```solidity
function version() external view returns (string memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`string`|string version.|


