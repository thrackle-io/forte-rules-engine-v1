# AccountMaxTradeSizeS
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/90e2ae1d7df03e5dac710c7ae0a8dd87e3b8b119/src/client/token/handler/diamond/RuleStorage.sol)


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

