# AccountMaxTradeSizeS
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/ca6c5450e5e6a46aa53ada940ee13a6c9dcc6be8/src/client/token/handler/diamond/RuleStorage.sol)


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

