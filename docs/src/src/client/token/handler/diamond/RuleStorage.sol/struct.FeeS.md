# FeeS
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/1d703cedb38743c0c4b996d79399b43cea9338a4/src/client/token/handler/diamond/RuleStorage.sol)


```solidity
struct FeeS {
    mapping(bytes32 => Fee) feesByTag;
    uint256 feeTotal;
    bool feeActive;
}
```

