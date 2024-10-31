# TokenMaxSupplyVolatilityS
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/80d1936ea39e283e25322fe390d911cd354fcdef/src/client/token/handler/diamond/RuleStorage.sol)


```solidity
struct TokenMaxSupplyVolatilityS {
    mapping(ActionTypes => bool) tokenMaxSupplyVolatility;
    uint32 ruleId;
    uint64 lastSupplyUpdateTime;
    int256 volumeTotalForPeriod;
    uint256 totalSupplyForPeriod;
}
```

