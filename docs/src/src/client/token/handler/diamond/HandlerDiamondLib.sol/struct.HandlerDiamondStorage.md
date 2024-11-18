# HandlerDiamondStorage
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/9fddf56ef55dac8b5660e8eb459c61d41ab7f720/src/client/token/handler/diamond/HandlerDiamondLib.sol)


```solidity
struct HandlerDiamondStorage {
    mapping(bytes4 => FacetAddressAndSelectorPosition) facetAddressAndSelectorPosition;
    bytes4[] selectors;
}
```

