# IPauseRuleErrors
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/c24a67035f9dc2b86d52113e68cb76f2f45fa3f2/src/common/IErrors.sol)


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

