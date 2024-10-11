# IPauseRuleErrors
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/05058af162713f188a988f6affb17d318400fb7d/src/common/IErrors.sol)


## Errors
### ApplicationPaused

```solidity
error ApplicationPaused(uint256 started, uint256 ends);
```

### InvalidDateWindow

```solidity
error InvalidDateWindow(uint256 startDate, uint256 endDate);
```

### MaxPauseRulesReached

```solidity
error MaxPauseRulesReached();
```

