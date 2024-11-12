# Gas Estimate Per Rule ERC721
[![Project Version][version-image]][version-url]

---

## Purpose

This chart shows how individual active rules affect gas consumption of basic token actions.

The gas tests were done using simple ERC20 and ERC721 tokens that integrate the Forte Rules Engine. The comparison is between the base usage(Rules engine integrated but with no active rules) and with the rule active and passing.

Column Definitions
- Rule = Named Rule Engine rule being tested
- Action = User action being tested
- With Rules Engine Integrated = Amount of gas used with the Rules Engine integrated but no active rules
- With Rule Active = Amount of gas used with the rule active and passing
- Additional Gas = Additional gas used to evaluate the rule
- % Increase = Percentage increase in gas used to evaluate the rule(difference divided by original amount * 100) 

## ERC721

---
For a baseline cost of actions in ERC721, note that transferFroms in a base OZ implementation typically have a cost of 33,977 gas, burns are 10,981, and safeMints are 30,755.

| Rule | Action | With Rules Engine Integrated | With Rule Active | Additional Gas | % Increase |
|:-|:-|:-|:-|:-|:-| 
| [Account Approve/Deny Oracle](../rules/ACCOUNT-APPROVE-DENY-ORACLE.md) | transferFrom | 87,027 | 92,672 | 5,645 | 6.5% |
| | burn | 44,409 | 47,233 | 2,824 | 6.4% |
| | safeMint | 152,333 | 155,157 | 2,824 | 1.9% |
| [Account Approve/Deny Oracle Flexible](../rules/ACCOUNT-APPROVE-DENY-ORACLE-FLEXIBLE.md) | transferFrom | 87,027 | 90,045 | 3,018 | 3.5% |
| | burn | 44,409 | 47,427 | 3,018 | 6.8% |
| | safeMint | 152,333 | 155,351 | 3,018 | 2.0% |
| [Account Deny For No Access Level Rule](../rules/ACCOUNT-DENY-FOR-NO-ACCESS-LEVEL.md) | transferFrom | 87,027 | 119,510 | 32,483 | 37.3% |
| | burn | 44,409 | n/a | n/a | n/a |
| | safeMint | 152,333 | 185,697 | 33,364 | 21.9% |
| [Account Max Trade Size](../rules/ACCOUNT-MAX-TRADE-SIZE.md) | transferFrom(sell/buy) | 97,251 | 111,826 | 14,575 | 15.0% |
| | burn | 44,409 | n/a | n/a | n/a |
| | safeMint | 152,333 | n/a | n/a | n/a |
| [Account Max Tx Value By Risk Score](../rules/ACCOUNT-MAX-TX-VALUE-BY-RISK-SCORE.md)| transferFrom | 87,027 | 130,781 | 43,754 | 50.3% |
| | burn | 44,409 | n/a | n/a | n/a |
| | safeMint | 152,333 | 190,933 | 38,600 | 25.3% |
| [Account Max Value By Access Level Rule](../rules/ACCOUNT-MAX-VALUE-BY-ACCESS-LEVEL.md) | transferFrom | 87,027 | 119,040 | 32,013 | 36.8% |
| | burn | 44,409 | n/a | n/a | n/a |
| | safeMint | 152,333 | 186,643 | 34,310 | 22.5% |
| [Account Max Value by Risk Rule](../rules/ACCOUNT-MAX-VALUE-BY-RISK.md) | transferFrom | 87,027 | 120,981 | 33,954 | 39.0% |
| | burn | 44,409 | n/a | n/a | n/a |
| | safeMint | 152,333 | 188,584 | 36,251 | 23.8% |
| [Account Max Value Out By Access Level](../rules/ACCOUNT-MAX-VALUE-BY-ACCESS-LEVEL.md) | transferFrom | 87,027 | 122,138 | 35,111 | 40.3% |
| | burn | 44,409 | 67,262 | 22,853 | 51.5% |
| | safeMint | 152,333 | n/a | n/a | n/a |
| [Account Min/Max Token Balance Rule](../rules/ACCOUNT-MIN-MAX-TOKEN-BALANCE.md) | transferFrom | 87,027 | 103,202 | 16,175 | 18.6% |
| | burn | 44,409 | 55,699 | 11,290 | 25.4% |
| | safeMint | 152,333 | 165,363 | 13,030 | 8.6% |
| [Token Max Buy-Sell Volume Rule](../rules/TOKEN-MAX-BUY-SELL-VOLUME.md) | transferFrom | 87,027 | 108,745 | 11,494 | 11.8% |
| | burn | 44,409 | n/a | n/a | n/a |
| | safeMint | 152,333 | n/a | n/a | n/a |
| [Token Max Daily Trades Rule](../rules/TOKEN-MAX-DAILY-TRADES.md) | transferFrom | 87,027 | 143,062 | 56,035 | 64.4% |
| | burn | 44,409 | n/a | n/a | n/a |
| | safeMint | 152,333 | 208,371 | 56,038 | 36.8% |
| [Token Max Supply Volatility Rule](../rules/TOKEN-MAX-SUPPLY-VOLATILITY.md) | transferFrom | 87,027 | n/a | 0 | 0 |
| | burn | 44,409 | 50,763 | 6,354 | 14.3% |
| | safeMint | 152,333 | 178,445 | 26,112 | 17.1% |
| [Token Max Trading Volume](../rules/TOKEN-MAX-TRADING-VOLUME.md) | transferFrom | 87,027 | 92,392 | 5,365 | 6.2% |
| | burn | 44,409 | 50,763 | 6,354 | 14.3% |
| | safeMint | 152,333 | 157,698 | 5,365 | 3.5% |
| [Token Minimum Hold Time](../rules/TOKEN-MIN-HOLD-TIME.md) | transferFrom | 87,027 | 90,329 | 3,302 | 3.8% | 
| | burn | 44,409 | 47,416 | 3,007 | 6.8% |
| | safeMint | 152,333 | n/a | n/a | n/a |

## ERC20
---
For ERC20, note that transfers in a base OZ implementation typically have a cost of 30,544 gas, burns are 8,325, and mints are 8,317.
| Rule | Action | With Rules Engine Integrated | With Rule Active | Additional Gas | % Increase |
|:-|:-|:-|:-|:-|:-|
| [Account Approve/Deny Oracle](../rules/ACCOUNT-APPROVE-DENY-ORACLE.md) | transfer | 39,001 | 44,646 | 5,645 | 14.5% |
|  | burn | 30,970 | 33,794 | 2,824 | 9.1% |
|  | mint | 31,241 | 34,065 | 2,824 | 9.0% |
| [Account Approve/Deny Oracle Flexible](../rules/ACCOUNT-APPROVE-DENY-ORACLE-FLEXIBLE.md) | transfer | 39,001 | 42,019 | 3,018 | 7.7% |
|  | burn | 30,970 | 33,988 | 3,018 | 9.7% |
|  | mint | 31,241 | 34,259 | 3,018 | 9.7% |
| [Account Deny For No Access Level Rule](../rules/ACCOUNT-DENY-FOR-NO-ACCESS-LEVEL.md)  | transfer | 39,001 | 67,840 | 28,839 | 73.9% |
|  | burn | 30,970 | n/a | n/a | n/a |
|  | mint | 31,241 | 58,961 | 27,720 | 88.7% |
| [Account Max Trade Size](../rules/ACCOUNT-MAX-TRADE-SIZE.md) | transfer(sell) | 45,450 | 52,748 | 7,298 | 16.1% |
|  | burn | 30,970 | n/a | n/a | n/a |
|  | mint | 31,241 | n/a | n/a | n/a |
| [Account Max Tx Value By Risk Score](../rules/ACCOUNT-MAX-TX-VALUE-BY-RISK-SCORE.md) | transfer | 39,001 | 79,114 | 40,113 | 102.9% |
|  | burn | 30,970 | n/a | n/a | n/a |
|  | mint | 31,241 | 64,197 | 32,956 | 105.5% |
| [Account Max Value By Access Level Rule](../rules/ACCOUNT-MAX-VALUE-BY-ACCESS-LEVEL.md) | transfer | 39,001 | 67,372 | 28,371 | 72.7% |
|  | burn | 30,970 | n/a | n/a | n/a |
|  | mint | 31,241 | 59,906 | 28,665 | 91.8% |
| [Account Max Value by Risk Rule](../rules/ACCOUNT-MAX-VALUE-BY-RISK.md) | transfer | 39,001 | 69,314 | 30,313 | 77.7% |
|  | burn | 30,970 | n/a | n/a | n/a |
|  | mint | 31,241 | 61,848 | 30,607 | 98.0% |
| [Account Max Value Out By Access Level](../rules/ACCOUNT-MAX-VALUE-BY-ACCESS-LEVEL.md) | transfer | 39,001 | 68,470 | 29,469 | 75.6% |
|  | burn | 30,970 | 52,322 | 21,352 | 68.9% |
|  | mint | 31,241 | n/a | n/a | n/a |
| [Account Min/Max Token Balance Rule](../rules/ACCOUNT-MIN-MAX-TOKEN-BALANCE.md) | transfer | 39,001 | 55,179 | 16,178 | 41.5% |
|  | burn | 30,970 | 42,260 | 11,290 | 36.5% |
|  | mint | 31,241 | 44,271 | 13,030 | 41.7% |
| [Token Max Buy-Sell Volume Rule](../rules/TOKEN-MAX-BUY-SELL-VOLUME.md) | transfer(sell) | 45,450 | 51,153 | 5,703 | 12.5% |
|  | burn | 30,970 | n/a | n/a | n/a |
|  | mint | 31,241 | n/a | n/a | n/a |
| [Token Max Supply Volatility Rule](../rules/TOKEN-MAX-SUPPLY-VOLATILITY.md) | transfer | 39,001 | n/a | n/a | n/a |
|  | burn | 30,970 | 37,322 | 6,352 | 20.5% |
|  | mint | 31,241 | 57,351 | 26,110 | 83.6% |
| [Token Max Trading Volume](../rules/TOKEN-MAX-TRADING-VOLUME.md) | transfer | 39,001 | 44,364 | 5,363 | 13.8% |
|  | burn | 30,970 | n/a | n/a | n/a |
|  | mint | 31,241 | 36,604 | 5,363 | 17.2% |
| [Token Min Transaction Size](../rules/TOKEN-MIN-TRANSACTION-SIZE.md) | transfer | 39,001 | 41,654 | 2,653 | 6.8% |
|  | burn | 30,970 | 33,623 | 2,653 | 8.6% |
|  | mint | 31,241 | 33,894 | 2,653 | 8.5% |


<!-- These are the header links -->
[version-image]: https://img.shields.io/badge/Version-2.1.0-brightgreen?style=for-the-badge&logo=appveyor
[version-url]: https://github.com/thrackle-io/forte-rules-engine


