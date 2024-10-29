# TokenMaxSupplyVolatilityS
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/5026b0b8ff56953bd0f2675bfc42f5fa45097500/src/client/token/handler/diamond/RuleStorage.sol)


```solidity
struct TokenMaxSupplyVolatilityS {
    mapping(ActionTypes => bool) tokenMaxSupplyVolatility;
    uint32 ruleId;
    uint64 lastSupplyUpdateTime;
    int256 volumeTotalForPeriod;
    uint256 totalSupplyForPeriod;
}
```

