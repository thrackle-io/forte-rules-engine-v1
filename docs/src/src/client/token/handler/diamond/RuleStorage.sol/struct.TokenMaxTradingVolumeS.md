# TokenMaxTradingVolumeS
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/05058af162713f188a988f6affb17d318400fb7d/src/client/token/handler/diamond/RuleStorage.sol)


```solidity
struct TokenMaxTradingVolumeS {
    mapping(ActionTypes => bool) tokenMaxTradingVolume;
    uint32 ruleId;
    uint256 transferVolume;
    uint64 lastTransferTime;
}
```

