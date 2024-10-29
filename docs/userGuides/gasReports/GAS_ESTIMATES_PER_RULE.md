# Gas Estimate Per Rule ERC721
[![Project Version][version-image]][version-url]

---

## Purpose

This chart shows how individual active rules affect gas consumption of basic token actions.

The gas tests were done using simple ERC20 and ERC721 tokens that integrate the Forte Rules Engine. The comparison is between the base usage(Rules engine integrated but with no active rules) and with the rule active and passing.

Column Definitions
- Rule = Named Rule Engine rule being tested
- Action = User action being tested
- Base Usage = Amount of gas used with for the action with the Rules Engine integrated but no active rules
- Additional Gas = Additional gas used to evaluate the rule
- % Increase = Percentage increase in gas used to evaluate the rule(difference divided by original amount * 100) 

## ERC721

---
| Rule | Action | Base Usage | With Rule Usage | Additional Gas | % Increase |
|:-|:-|:-|:-|:-|:-| 
| [Account Approve/Deny Oracle](../rules/ACCOUNT-APPROVE-DENY-ORACLE.md) | transferFrom | 87027 | 92672 | 5645 | 6.5% |
| | burn | 44409 | 47233 | 2824 | 6.4% |
| | safeMint | 152333 | 155157 | 2824 | 1.9% |
| [Account Approve/Deny Oracle Flexible](../rules/ACCOUNT-APPROVE-DENY-ORACLE-FLEXIBLE.md) | transferFrom | 87027 | 90045 | 3018 | 3.5% |
| | burn | 44409 | 47427 | 3018 | 6.8% |
| | safeMint | 152333 | 155351 | 3018 | 2.0% |
| [Account Deny For No Access Level Rule](../rules/ACCOUNT-DENY-FOR-NO-ACCESS-LEVEL.md) | transferFrom | 87027 | 119510 | 32483 | 37.3% |
| | burn | 44409 | n/a | n/a | n/a |
| | safeMint | 152333 | 185697 | 33364 | 21.9% |
| [Account Max Trade Size](../rules/ACCOUNT-MAX-TRADE-SIZE.md) | transferFrom(sell/buy) | 97251 | 111826 | 14575 | 15.0% |
| | burn | 44409 | n/a | n/a | n/a |
| | safeMint | 152333 | n/a | n/a | n/a |
| [Account Max Tx Value By Risk Score](../rules/ACCOUNT-MAX-TX-VALUE-BY-RISK-SCORE.md)| transferFrom | 87027 | 130781 | 43754 | 50.3% |
| | burn | 44409 | n/a | n/a | n/a |
| | safeMint | 152333 | 190933 | 38600 | 25.3% |
| [Account Max Value By Access Level Rule](../rules/ACCOUNT-MAX-VALUE-BY-ACCESS-LEVEL.md) | transferFrom | 87027 | 119040 | 32013 | 36.8% |
| | burn | 44409 | n/a | n/a | n/a |
| | safeMint | 152333 | 186643 | 34310 | 22.5% |
| [Account Max Value by Risk Rule](../rules/ACCOUNT-MAX-VALUE-BY-RISK.md) | transferFrom | 87027 | 120981 | 33954 | 39.0% |
| | burn | 44409 | n/a | n/a | n/a |
| | safeMint | 152333 | 188584 | 36251 | 23.8% |
| [Account Max Value Out By Access Level](../rules/ACCOUNT-MAX-VALUE-BY-ACCESS-LEVEL.md) | transferFrom | 87027 | 122138 | 35111 | 40.3% |
| | burn | 44409 | 67262 | 22853 | 51.5% |
| | safeMint | 152333 | n/a | n/a | n/a |
| [Account Min/Max Token Balance Rule](../rules/ACCOUNT-MIN-MAX-TOKEN-BALANCE.md) | transferFrom | 87027 | 103202 | 16175 | 18.6% |
| | burn | 44409 | 55699 | 11290 | 25.4% |
| | safeMint | 152333 | 165363 | 13030 | 8.6% |
| [Token Max Buy-Sell Volume Rule](../rules/TOKEN-MAX-BUY-SELL-VOLUME.md) | transferFrom | 87027 | 108745 | 11494 | 11.8% |
| | burn | 44409 | n/a | n/a | n/a |
| | safeMint | 152333 | n/a | n/a | n/a |
| [Token Max Daily Trades Rule](../rules/TOKEN-MAX-DAILY-TRADES.md) | transferFrom | 87027 | 143062 | 56035 | 64.4% |
| | burn | 44409 | n/a | n/a | n/a |
| | safeMint | 152333 | 208371 | 56038 | 36.8% |
| [Token Max Supply Volatility Rule](../rules/TOKEN-MAX-SUPPLY-VOLATILITY.md) | transferFrom | 87027 | n/a | 0 | 0 |
| | burn | 44409 | 50763 | 6354 | 14.3% |
| | safeMint | 152333 | 178445 | 26112 | 17.1% |
| [Token Max Trading Volume](../rules/TOKEN-MAX-TRADING-VOLUME.md) | transferFrom | 87027 | 92392 | 5365 | 6.2% |
| | burn | 44409 | 50763 | 6354 | 14.3% |
| | safeMint | 152333 | 157698 | 5365 | 3.5% |
| [Token Minimum Hold Time](../rules/TOKEN-MIN-HOLD-TIME.md) | transferFrom | 87027 | 90329 | 3302 | 3.8% | 
| | burn | 44409 | 47416 | 3007 | 6.8% |
| | safeMint | 152333 | n/a | n/a | n/a |

## ERC20

---
| Rule | Action | Base Usage | With Rule Usage | Additional Gas | % Increase |
|:-|:-|:-|:-|:-|:-| 
| [Account Approve/Deny Oracle](../rules/ACCOUNT-APPROVE-DENY-ORACLE.md) | transfer | 39001 | 44646 | 5645 | 14.5% |
|  | burn | 30970 | 33794 | 2824 | 9.1% |
|  | mint | 31241 | 34065 | 2824 | 9.0% |
| [Account Approve/Deny Oracle Flexible](../rules/ACCOUNT-APPROVE-DENY-ORACLE-FLEXIBLE.md) | transfer | 39001 | 42019 | 3018 | 7.7% |
|  | burn | 30970 | 33988 | 3018 | 9.7% |
|  | mint | 31241 | 34259 | 3018 | 9.7% |
| [Account Deny For No Access Level Rule](../rules/ACCOUNT-DENY-FOR-NO-ACCESS-LEVEL.md)  | transfer | 39001 | 67840 | 28839 | 73.9% |
|  | burn | 30970 | n/a | n/a | n/a |
|  | mint | 31241 | 58961 | 27720 | 88.7% |
| [Account Max Trade Size](../rules/ACCOUNT-MAX-TRADE-SIZE.md) | transfer(sell) | 45450 | 52748 | 7298 | 16.1% |
|  | burn | 30970 | n/a | n/a | n/a |
|  | mint | 31241 | n/a | n/a | n/a |
| [Account Max Tx Value By Risk Score](../rules/ACCOUNT-MAX-TX-VALUE-BY-RISK-SCORE.md) | transfer | 39001 | 79114 | 40113 | 102.9% |
|  | burn | 30970 | n/a | n/a | n/a |
|  | mint | 31241 | 64197 | 32956 | 105.5% |
| [Account Max Value By Access Level Rule](../rules/ACCOUNT-MAX-VALUE-BY-ACCESS-LEVEL.md) | transfer | 39001 | 67372 | 28371 | 72.7% |
|  | burn | 30970 | n/a | n/a | n/a |
|  | mint | 31241 | 59906 | 28665 | 91.8% |
| [Account Max Value by Risk Rule](../rules/ACCOUNT-MAX-VALUE-BY-RISK.md) | transfer | 39001 | 69314 | 30313 | 77.7% |
|  | burn | 30970 | n/a | n/a | n/a |
|  | mint | 31241 | 61848 | 30607 | 98.0% |
| [Account Max Value Out By Access Level](../rules/ACCOUNT-MAX-VALUE-BY-ACCESS-LEVEL.md) | transfer | 39001 | 68470 | 29469 | 75.6% |
|  | burn | 30970 | 52322 | 21352 | 68.9% |
|  | mint | 31241 | n/a | n/a | n/a |
| [Account Min/Max Token Balance Rule](../rules/ACCOUNT-MIN-MAX-TOKEN-BALANCE.md) | transfer | 39001 | 55179 | 16178 | 41.5% |
|  | burn | 30970 | 42260 | 11290 | 36.5% |
|  | mint | 31241 | 44271 | 13030 | 41.7% |
| [Token Max Buy-Sell Volume Rule](../rules/TOKEN-MAX-BUY-SELL-VOLUME.md) | transfer(sell) | 45450 | 51153 | 5703 | 12.5% |
|  | burn | 30970 | n/a | n/a | n/a |
|  | mint | 31241 | n/a | n/a | n/a |
| [Token Max Supply Volatility Rule](../rules/TOKEN-MAX-SUPPLY-VOLATILITY.md) | transfer | 39001 | n/a | n/a | n/a |
|  | burn | 30970 | 37322 | 6352 | 20.5% |
|  | mint | 31241 | 57351 | 26110 | 83.6% |
| [Token Max Trading Volume](../rules/TOKEN-MAX-TRADING-VOLUME.md) | transfer | 39001 | 44364 | 5363 | 13.8% |
|  | burn | 30970 | n/a | n/a | n/a |
|  | mint | 31241 | 36604 | 5363 | 17.2% |
| [Token Min Transaction Size](../rules/TOKEN-MIN-TRANSACTION-SIZE.md) | transfer | 39001 | 41654 | 2653 | 6.8% |
|  | burn | 30970 | 33623 | 2653 | 8.6% |
|  | mint | 31241 | 33894 | 2653 | 8.5% |


<!-- These are the header links -->
[version-image]: https://img.shields.io/badge/Version-2.1.0-brightgreen?style=for-the-badge&logo=appveyor
[version-url]: https://github.com/thrackle-io/forte-rules-engine


