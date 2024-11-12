# IOracleEvents
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/711083cf73df92cf4f18e3e51c50d0b3b5021828/src/common/IEvents.sol)

Oracle Events Library

*The library for all events for the Oracle contracts for the protocol.*


## Events
### AD1467_ApprovedAddress

```solidity
event AD1467_ApprovedAddress(address indexed addr, bool isApproved);
```

### AD1467_ApproveListOracleDeployed

```solidity
event AD1467_ApproveListOracleDeployed();
```

### AD1467_DeniedAddress

```solidity
event AD1467_DeniedAddress(address indexed addr, bool isDenied);
```

### AD1467_DeniedListOracleDeployed

```solidity
event AD1467_DeniedListOracleDeployed();
```

### AD1467_OracleListChanged

```solidity
event AD1467_OracleListChanged(bool indexed add, address[] addresses);
```

