# AccountMaxTradeSizeS
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/05058af162713f188a988f6affb17d318400fb7d/src/client/token/handler/diamond/RuleStorage.sol)


```solidity
struct AccountMaxTradeSizeS {
    mapping(ActionTypes => Rule) accountMaxTradeSize;
    mapping(address => uint256) boughtInPeriod;
    mapping(address => uint64) lastPurchaseTime;
    mapping(address => uint256) salesInPeriod;
    mapping(address => uint64) lastSellTime;
    uint256 ruleChangeDate;
}
```

