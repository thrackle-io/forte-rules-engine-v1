# TokenMaxBuySellVolumeS
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/82c852aae835019a12c3223cb7eabe7f59f19e1a/src/client/token/handler/diamond/RuleStorage.sol)


```solidity
struct TokenMaxBuySellVolumeS {
    mapping(ActionTypes => Rule) tokenMaxBuySellVolume;
    uint256 boughtInPeriod;
    uint64 lastPurchaseTime;
    uint256 salesInPeriod;
    uint64 lastSellTime;
}
```

