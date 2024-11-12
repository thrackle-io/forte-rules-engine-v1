# IAppManagerUser
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/5abe0bdd205a0cc39e18fc6dac3a712362e23f50/src/client/application/IAppManagerUser.sol)

**Author:**
@ShaneDuncan602, @oscarsernarosero, @TJ-Everett

Interface for app manager user functions.

*This interface is implemented by all contracts that use AppManager. It provides the common function for setting up a new link to an AppManager*


## Functions
### confirmAppManagerAddress

*This function confirms a new appManagerAddress that was put in storage. It can only be confirmed by the proposed address*


```solidity
function confirmAppManagerAddress() external;
```

