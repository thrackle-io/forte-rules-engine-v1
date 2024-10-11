# HandlerDiamondArgs
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/93dbcb0957f5052559ba2373cb0af1eb95185e37/src/client/token/handler/diamond/HandlerDiamond.sol)

This is used in diamond constructor
more arguments are added to this struct
this avoids stack too deep errors


```solidity
struct HandlerDiamondArgs {
    address init;
    bytes initCalldata;
}
```

