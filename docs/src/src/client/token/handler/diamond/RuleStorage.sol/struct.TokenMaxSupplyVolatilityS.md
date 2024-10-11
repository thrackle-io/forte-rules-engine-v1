# TokenMaxSupplyVolatilityS
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/93dbcb0957f5052559ba2373cb0af1eb95185e37/src/client/token/handler/diamond/RuleStorage.sol)


```solidity
struct TokenMaxSupplyVolatilityS {
    mapping(ActionTypes => bool) tokenMaxSupplyVolatility;
    uint32 ruleId;
    uint64 lastSupplyUpdateTime;
    int256 volumeTotalForPeriod;
    uint256 totalSupplyForPeriod;
}
```

