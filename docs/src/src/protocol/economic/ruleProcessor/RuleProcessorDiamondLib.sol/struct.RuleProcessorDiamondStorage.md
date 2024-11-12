# RuleProcessorDiamondStorage
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/5abe0bdd205a0cc39e18fc6dac3a712362e23f50/src/protocol/economic/ruleProcessor/RuleProcessorDiamondLib.sol)


```solidity
struct RuleProcessorDiamondStorage {
    mapping(bytes4 => FacetAddressAndSelectorPosition) facetAddressAndSelectorPosition;
    bytes4[] selectors;
}
```

