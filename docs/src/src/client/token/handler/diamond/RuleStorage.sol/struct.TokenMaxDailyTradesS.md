# TokenMaxDailyTradesS
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/9fddf56ef55dac8b5660e8eb459c61d41ab7f720/src/client/token/handler/diamond/RuleStorage.sol)


```solidity
struct TokenMaxDailyTradesS {
    mapping(ActionTypes => Rule) tokenMaxDailyTrades;
    mapping(uint32 => mapping(uint256 => uint256)) tradesInPeriod;
    mapping(uint32 => mapping(uint256 => uint64)) lastTxDate;
    uint256 ruleChangeDate;
}
```

