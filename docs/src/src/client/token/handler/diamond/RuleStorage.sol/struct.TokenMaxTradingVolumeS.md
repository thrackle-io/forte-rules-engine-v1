# TokenMaxTradingVolumeS
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/4a2e9b2745fc1ebf2913bcb6fdbbd0ad4f2bfe93/src/client/token/handler/diamond/RuleStorage.sol)


```solidity
struct TokenMaxTradingVolumeS {
    mapping(ActionTypes => bool) tokenMaxTradingVolume;
    uint32 ruleId;
    uint256 transferVolume;
    uint64 lastTransferTime;
}
```

