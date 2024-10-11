# TokenMaxDailyTradesS
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/05058af162713f188a988f6affb17d318400fb7d/src/client/token/handler/diamond/RuleStorage.sol)


```solidity
struct TokenMaxDailyTradesS {
    mapping(ActionTypes => Rule) tokenMaxDailyTrades;
    mapping(uint32 => mapping(uint256 => uint256)) tradesInPeriod;
    mapping(uint32 => mapping(uint256 => uint64)) lastTxDate;
    uint256 ruleChangeDate;
}
```

