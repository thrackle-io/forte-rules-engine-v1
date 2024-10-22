# HandlerDiamondStorage
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/a5f86c82f92d74cf46bb4f0f59e066361ee97617/src/client/token/handler/diamond/HandlerDiamondLib.sol)


```solidity
struct HandlerDiamondStorage {
    mapping(bytes4 => FacetAddressAndSelectorPosition) facetAddressAndSelectorPosition;
    bytes4[] selectors;
}
```

