# HandlerDiamondStorage
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/ca6c5450e5e6a46aa53ada940ee13a6c9dcc6be8/src/client/token/handler/diamond/HandlerDiamondLib.sol)


```solidity
struct HandlerDiamondStorage {
    mapping(bytes4 => FacetAddressAndSelectorPosition) facetAddressAndSelectorPosition;
    bytes4[] selectors;
}
```

