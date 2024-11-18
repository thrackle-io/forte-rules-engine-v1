# TokenMaxSupplyVolatilityS
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/9fddf56ef55dac8b5660e8eb459c61d41ab7f720/src/client/token/handler/diamond/RuleStorage.sol)


```solidity
struct TokenMaxSupplyVolatilityS {
    mapping(ActionTypes => bool) tokenMaxSupplyVolatility;
    uint32 ruleId;
    uint64 lastSupplyUpdateTime;
    int256 volumeTotalForPeriod;
    uint256 totalSupplyForPeriod;
}
```

