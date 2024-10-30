# IAppManagerUser
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/ca6c5450e5e6a46aa53ada940ee13a6c9dcc6be8/src/client/application/IAppManagerUser.sol)

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

