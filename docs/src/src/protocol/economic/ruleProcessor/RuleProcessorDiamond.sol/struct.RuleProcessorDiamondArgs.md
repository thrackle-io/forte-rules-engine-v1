# RuleProcessorDiamondArgs
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/90e2ae1d7df03e5dac710c7ae0a8dd87e3b8b119/src/protocol/economic/ruleProcessor/RuleProcessorDiamond.sol)

This is used in diamond constructor
more arguments are added to this struct
this avoids stack too deep errors


```solidity
struct RuleProcessorDiamondArgs {
    address init;
    bytes initCalldata;
}
```

