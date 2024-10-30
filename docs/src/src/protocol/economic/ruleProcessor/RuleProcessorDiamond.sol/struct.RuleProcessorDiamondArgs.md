# RuleProcessorDiamondArgs
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/200d020323d0bfc33b4363e6f8e549888a2ff94d/src/protocol/economic/ruleProcessor/RuleProcessorDiamond.sol)

This is used in diamond constructor
more arguments are added to this struct
this avoids stack too deep errors


```solidity
struct RuleProcessorDiamondArgs {
    address init;
    bytes initCalldata;
}
```

