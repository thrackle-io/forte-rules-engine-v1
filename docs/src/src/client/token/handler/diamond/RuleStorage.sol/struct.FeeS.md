# FeeS
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/7ed34a62033174e2129a3d6ffafc4f97afb624f7/src/client/token/handler/diamond/RuleStorage.sol)


```solidity
struct FeeS {
    mapping(bytes32 => Fee) feesByTag;
    uint256 feeTotal;
    bool feeActive;
}
```

