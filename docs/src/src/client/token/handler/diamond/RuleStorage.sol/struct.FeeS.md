# FeeS
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/ca6c5450e5e6a46aa53ada940ee13a6c9dcc6be8/src/client/token/handler/diamond/RuleStorage.sol)


```solidity
struct FeeS {
    mapping(bytes32 => Fee) feesByTag;
    uint256 feeTotal;
    bool feeActive;
}
```

