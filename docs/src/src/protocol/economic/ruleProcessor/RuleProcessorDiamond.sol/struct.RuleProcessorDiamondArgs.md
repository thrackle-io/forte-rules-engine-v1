# RuleProcessorDiamondArgs
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/5abe0bdd205a0cc39e18fc6dac3a712362e23f50/src/protocol/economic/ruleProcessor/RuleProcessorDiamond.sol)

This is used in diamond constructor
more arguments are added to this struct
this avoids stack too deep errors


```solidity
struct RuleProcessorDiamondArgs {
    address init;
    bytes initCalldata;
}
```

