The data/format below is provided as an example to guide you.

## 1. Repository Links

- https://github.com/thrackle-io/forte-rules-engine

## 2. Branches

- main

## File paths to INCLUDE

```
src/*
```

## Priority files

✅ Identify files that should receive extra attention:
```
src/client/application/AppManager.sol
src/client/token/ProtocolTokenCommon.sol
src/client/token/ProtocolTokenCommonU.sol
src/client/token/ERC20/upgradeable/ProtocolERC20UMin.sol
src/client/token/ERC721/upgradeable/ProtocolERC721U.sol
src/client/token/ERC721/upgradeable/ProtocolERC721Umin.sol
src/client/token/handler/diamond/*
src/protocol/economic/ruleProcessor/*
```

## Areas of concern

✅ List specific issues or vulnerabilities you want the audit to focus on:

```
- Malicious user actions (blocking valid transactions, redirecting funds, etc)
- Bypassing a rule that should cause a transaction to fail
- Any ability to circumvent permissions (adding/modifying/deleting rules, bypassing checks, etc)
```
