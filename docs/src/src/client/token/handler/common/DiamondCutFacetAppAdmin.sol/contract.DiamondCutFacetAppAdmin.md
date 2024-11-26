# DiamondCutFacetAppAdmin
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/7ed34a62033174e2129a3d6ffafc4f97afb624f7/src/client/token/handler/common/DiamondCutFacetAppAdmin.sol)

**Inherits:**
IDiamondCut, ERC173, [AppAdministratorOrOwnerOnlyDiamondVersion](/src/client/token/handler/common/AppAdministratorOrOwnerOnlyDiamondVersion.sol/contract.AppAdministratorOrOwnerOnlyDiamondVersion.md)


## Functions
### diamondCut

Add/replace/remove any number of functions and optionally execute
a function with delegatecall


```solidity
function diamondCut(FacetCut[] calldata _diamondCut, address init, bytes calldata data)
    external
    override
    appAdministratorOrOwnerOnly(lib.handlerBaseStorage().appManager);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_diamondCut`|`FacetCut[]`|Contains the facet addresses and function selectors|
|`init`|`address`|The address of the contract or facet to execute "data"|
|`data`|`bytes`|A function call, including function selector and arguments calldata is executed with delegatecall on "init"|


