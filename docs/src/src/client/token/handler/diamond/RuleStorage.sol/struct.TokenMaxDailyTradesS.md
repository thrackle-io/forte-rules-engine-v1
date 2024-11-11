# TokenMaxDailyTradesS
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/bdbc52f883a20b14a0585dd8216061e6f7e40df3/src/client/token/handler/diamond/RuleStorage.sol)


```solidity
struct TokenMaxDailyTradesS {
    mapping(ActionTypes => Rule) tokenMaxDailyTrades;
    mapping(uint32 => mapping(uint256 => uint256)) tradesInPeriod;
    mapping(uint32 => mapping(uint256 => uint64)) lastTxDate;
    uint256 ruleChangeDate;
}
```

