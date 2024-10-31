# RuleProcessorDiamondArgs
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/80d1936ea39e283e25322fe390d911cd354fcdef/src/protocol/economic/ruleProcessor/RuleProcessorDiamond.sol)

This is used in diamond constructor
more arguments are added to this struct
this avoids stack too deep errors


```solidity
struct RuleProcessorDiamondArgs {
    address init;
    bytes initCalldata;
}
```

