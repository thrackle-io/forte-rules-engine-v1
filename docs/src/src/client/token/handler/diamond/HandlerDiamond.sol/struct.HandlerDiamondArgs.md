# HandlerDiamondArgs
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/05058af162713f188a988f6affb17d318400fb7d/src/client/token/handler/diamond/HandlerDiamond.sol)

This is used in diamond constructor
more arguments are added to this struct
this avoids stack too deep errors


```solidity
struct HandlerDiamondArgs {
    address init;
    bytes initCalldata;
}
```

