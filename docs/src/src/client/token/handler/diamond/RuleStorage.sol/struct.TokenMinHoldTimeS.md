# TokenMinHoldTimeS
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/711083cf73df92cf4f18e3e51c50d0b3b5021828/src/client/token/handler/diamond/RuleStorage.sol)


```solidity
struct TokenMinHoldTimeS {
    mapping(ActionTypes => TokenMinHoldTime) tokenMinHoldTime;
    mapping(uint256 => uint256) ownershipStart;
    uint256 ruleChangeDate;
    bool anyActionActive;
}
```

