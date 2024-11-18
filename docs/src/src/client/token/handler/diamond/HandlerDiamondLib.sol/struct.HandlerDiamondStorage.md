# HandlerDiamondStorage
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/1c8d4aea6c73ad5ec24590e9388e17186ef859be/src/client/token/handler/diamond/HandlerDiamondLib.sol)


```solidity
struct HandlerDiamondStorage {
    mapping(bytes4 => FacetAddressAndSelectorPosition) facetAddressAndSelectorPosition;
    bytes4[] selectors;
}
```

