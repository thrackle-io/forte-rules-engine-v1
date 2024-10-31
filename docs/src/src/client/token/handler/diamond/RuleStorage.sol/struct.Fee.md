# Fee
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/80d1936ea39e283e25322fe390d911cd354fcdef/src/client/token/handler/diamond/RuleStorage.sol)


```solidity
struct Fee {
    uint256 minBalance;
    uint256 maxBalance;
    int24 feePercentage;
    address feeSink;
}
```

