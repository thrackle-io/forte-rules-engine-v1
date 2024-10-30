# TokenMaxTradingVolumeS
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/200d020323d0bfc33b4363e6f8e549888a2ff94d/src/client/token/handler/diamond/RuleStorage.sol)


```solidity
struct TokenMaxTradingVolumeS {
    mapping(ActionTypes => bool) tokenMaxTradingVolume;
    uint32 ruleId;
    uint256 transferVolume;
    uint64 lastTransferTime;
}
```

