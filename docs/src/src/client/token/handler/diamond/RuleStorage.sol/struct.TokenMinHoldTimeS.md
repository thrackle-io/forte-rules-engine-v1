# TokenMinHoldTimeS
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/05058af162713f188a988f6affb17d318400fb7d/src/client/token/handler/diamond/RuleStorage.sol)


```solidity
struct TokenMinHoldTimeS {
    mapping(ActionTypes => TokenMinHoldTime) tokenMinHoldTime;
    mapping(uint256 => uint256) ownershipStart;
    uint256 ruleChangeDate;
    bool anyActionActive;
}
```

