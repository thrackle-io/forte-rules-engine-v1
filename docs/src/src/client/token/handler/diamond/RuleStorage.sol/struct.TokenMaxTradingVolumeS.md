# TokenMaxTradingVolumeS
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/1c8d4aea6c73ad5ec24590e9388e17186ef859be/src/client/token/handler/diamond/RuleStorage.sol)


```solidity
struct TokenMaxTradingVolumeS {
    mapping(ActionTypes => bool) tokenMaxTradingVolume;
    uint32 ruleId;
    uint256 transferVolume;
    uint64 lastTransferTime;
}
```

