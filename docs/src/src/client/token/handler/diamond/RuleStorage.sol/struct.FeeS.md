# FeeS
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/bdbc52f883a20b14a0585dd8216061e6f7e40df3/src/client/token/handler/diamond/RuleStorage.sol)


```solidity
struct FeeS {
    mapping(bytes32 => Fee) feesByTag;
    uint256 feeTotal;
    bool feeActive;
}
```

