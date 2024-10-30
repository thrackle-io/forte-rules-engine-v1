# IPauseRuleErrors
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/200d020323d0bfc33b4363e6f8e549888a2ff94d/src/common/IErrors.sol)


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

