# HandlerDiamondArgs
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/1d703cedb38743c0c4b996d79399b43cea9338a4/src/client/token/handler/diamond/HandlerDiamond.sol)

This is used in diamond constructor
more arguments are added to this struct
this avoids stack too deep errors


```solidity
struct HandlerDiamondArgs {
    address init;
    bytes initCalldata;
}
```

