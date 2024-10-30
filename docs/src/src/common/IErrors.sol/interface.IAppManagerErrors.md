# IAppManagerErrors
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/ca6c5450e5e6a46aa53ada940ee13a6c9dcc6be8/src/common/IErrors.sol)

**Inherits:**
[INoAddressToRemove](/src/common/IErrors.sol/interface.INoAddressToRemove.md)


## Errors
### PricingModuleNotConfigured

```solidity
error PricingModuleNotConfigured(address _erc20PricingAddress, address nftPricingAddress);
```

### NotAccessLevelAdministrator

```solidity
error NotAccessLevelAdministrator(address _address);
```

### NotRiskAdmin

```solidity
error NotRiskAdmin(address _address);
```

### NotAUser

```solidity
error NotAUser(address _address);
```

### AddressAlreadyRegistered

```solidity
error AddressAlreadyRegistered();
```

### NotRegisteredHandler

```solidity
error NotRegisteredHandler(address);
```

### ProposedAddressCannotBeSuperAdmin

```solidity
error ProposedAddressCannotBeSuperAdmin();
```

