# TokenMinHoldTimeS
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/80d1936ea39e283e25322fe390d911cd354fcdef/src/client/token/handler/diamond/RuleStorage.sol)


```solidity
struct TokenMinHoldTimeS {
    mapping(ActionTypes => TokenMinHoldTime) tokenMinHoldTime;
    mapping(uint256 => uint256) ownershipStart;
    uint256 ruleChangeDate;
    bool anyActionActive;
}
```

