# HandlerDiamondArgs
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/c68a304eba8615cfb7f60cfb23fe792f1083c190/src/client/token/handler/diamond/HandlerDiamond.sol)

This is used in diamond constructor
more arguments are added to this struct
this avoids stack too deep errors


```solidity
struct HandlerDiamondArgs {
    address init;
    bytes initCalldata;
}
```

