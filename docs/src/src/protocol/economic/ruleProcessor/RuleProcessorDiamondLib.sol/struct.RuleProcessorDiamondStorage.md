# RuleProcessorDiamondStorage
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/bdbc52f883a20b14a0585dd8216061e6f7e40df3/src/protocol/economic/ruleProcessor/RuleProcessorDiamondLib.sol)


```solidity
struct RuleProcessorDiamondStorage {
    mapping(bytes4 => FacetAddressAndSelectorPosition) facetAddressAndSelectorPosition;
    bytes4[] selectors;
}
```

