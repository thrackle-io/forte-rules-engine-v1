# RuleProcessorDiamondStorage
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/05058af162713f188a988f6affb17d318400fb7d/src/protocol/economic/ruleProcessor/RuleProcessorDiamondLib.sol)


```solidity
struct RuleProcessorDiamondStorage {
    mapping(bytes4 => FacetAddressAndSelectorPosition) facetAddressAndSelectorPosition;
    bytes4[] selectors;
}
```

