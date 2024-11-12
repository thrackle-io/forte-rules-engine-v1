# Fee
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/5abe0bdd205a0cc39e18fc6dac3a712362e23f50/src/client/token/handler/diamond/RuleStorage.sol)


```solidity
struct Fee {
    uint256 minBalance;
    uint256 maxBalance;
    int24 feePercentage;
    address feeSink;
}
```

