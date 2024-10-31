# RuleProcessorDiamondStorage
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/80d1936ea39e283e25322fe390d911cd354fcdef/src/protocol/economic/ruleProcessor/RuleProcessorDiamondLib.sol)


```solidity
struct RuleProcessorDiamondStorage {
    mapping(bytes4 => FacetAddressAndSelectorPosition) facetAddressAndSelectorPosition;
    bytes4[] selectors;
}
```

