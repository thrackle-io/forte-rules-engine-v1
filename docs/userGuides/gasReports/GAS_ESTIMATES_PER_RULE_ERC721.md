# Gas Estimate Per Rule ERC721
[![Project Version][version-image]][version-url]

---

## Purpose

This chart shows how individual active rules affect gas consumption of basic token actions.

Integrating the Rules Engine without activating any rules add n gas units.

Column Definitions
- Rule = Named Rule Engine rule being tested
- Action = User action being tested
- Base Usage = Amount of gas used with for the action with the Rules Engin integrated but no active rules
- Additional Gas = Additional gas used to evaluate the rule
- % Increase = Percentage increase in gas used to evaluate the rule(difference divided by original amount * 100) 


---
| Rule | Action | Base Usage | With Rule Usage | Additional Gas | % Increase |
|:-|:-|:-|:-|:-|:-| 
| [Account Deny For No Access Level Rule](../rules/ACCOUNT-DENY-FOR-NO-ACCESS-LEVEL.md) | transferFrom | 96812 | 126240 | 29428 | 30.4% |
| | burn | 68142 | n/a | n/a | n/a |
| | safeMint | 227166 | 302481 | 75315 | 33.2% |
| [Account Max Trade Size](../rules/ACCOUNT-MAX-TRADE-SIZE.md) | transferFrom | 96812 | 96806 | 0 | 0 |
| | burn | 68142 | n/a | n/a | n/a |
| | safeMint | 227166 | n/a | 0 | 0 |
| [Account Max Tx Value By Risk Score](../rules/ACCOUNT-MAX-TX-VALUE-BY-RISK-SCORE.md)| transferFrom | 96812 | 165413 | 68601 | 70.7% |
| | burn | 68142 | n/a | n/a | n/a |
| | safeMint | 227166 | 335116 | 107950 | 47.5% |
| [Account Balance by Risk Rule](../rules/ACCOUNT-MAX-VALUE-BY-RISK.md) | transferFrom | 96812 | 0 | 0 | 0 |
| | burn | 68142 | n/a | n/a | n/a |
| | safeMint | 227166 | 0 | 0 | 0 |
| [Account Max Value By Access Level Rule](../rules/ACCOUNT-MAX-VALUE-BY-ACCESS-LEVEL.md) | transferFrom | 96812 | 129772 | 32960 | 34.0% |
| | burn | 68142 | n/a | n/a | n/a |
| | safeMint | 227166 | 306926 | 79760 | 35.1% |
| [Account Min/Max Token Balance Rule](../rules/ACCOUNT-MIN-MAX-TOKEN-BALANCE.md) | transferFrom | 96812 | 96806 | 0 | 0 |
| | burn | 68142 | 68142 | 0 | 0 |
| | safeMint | 227166 | 224666 | 0 | 0 |
| [Account Max TxValue By Risk](../rules/ACCOUNT-MAX-VALUE-BY-RISK.md) | transferFrom | 96812 | 131713 | 0 | 0 |
| | burn | 68142 | n/a | n/a | n/a |
| | safeMint | 227166 | 308867 | 0 | 0 |
| [Account Max Value Out By Access Level](../rules/ACCOUNT-MAX-VALUE-BY-ACCESS-LEVEL.md) | transferFrom | 96812 | 186870 | 0 | 0 |
| | burn | 68142 | 66142 | 0 | 0 |
| | safeMint | 227166 | n/a | 0 | 0 |
| [Token Max Buy-Sell Volume Rule](../rules/TOKEN-MAX-BUY-SELL-VOLUME.md) | transferFrom | 96812 | 96806 | 0 | 0 |
| | burn | 68142 | n/a | 0 | 0 |
| | safeMint | 227166 | n/a | 0 | 0 |
| [Token Max Daily Trades Rule](../rules/TOKEN-MAX-DAILY-TRADES.md) | transferFrom | 96812 | 0 | 0 | 0 |
| | burn | 68142 | 0 | 0 | 0 |
| | safeMint | 227166 | 0 | 0 | 0 |
| [Token Max Supply Volatility Rule](../rules/TOKEN-MAX-SUPPLY-VOLATILITY.md) | transferFrom | 96812 | n/a | 0 | 0 |
| | burn | 68142 | 68142 | 0 | 0 |
| | safeMint | 227166 | 222166 | 0 | 0 |
| [Token Max Trading Volume](../rules/TOKEN-MAX-TRADING-VOLUME.md) | transferFrom | 96812 | 96806 | 0 | 0 |
| | burn | 68142 | n/a | 0 | 0 |
| | safeMint | 227166 | 222166 | 0 | 0 |
| [Token Minimum Hold Time](../rules/TOKEN-MIN-HOLD-TIME.md) | transferFrom | 96812 | 96806 | 0 | 0 | 
| | burn | 68142 | 68142 | 0 | 0 |
| | safeMint | 227166 | n/a | 0 | 0 |
| [Oracle](../rules/ACCOUNT-APPROVE-DENY-ORACLE.md) | transferFrom | 96812 | 96806 | 0 | 0 |
| | burn | 68142 | 68142 | 0 | 0 |
| | safeMint | 227166 | 222166 | 0 | 0 |
| [Pause Rule](../rules/PAUSE-RULE.md) | transferFrom | 96812 | 0 | 0 | 0 |
| | burn | 68142 | 0 | 0 | 0 |
| | safeMint | 227166 | 0 | 0 | 0 |
| [Transaction Size Per Time Period by Risk Score](../rules/ACCOUNT-MAX-TX-VALUE-BY-RISK-SCORE.md) | transferFrom | 96812 | 0 | 0 | 0 |
| | burn | 68142 | 0 | 0 | 0 |
| | safeMint | 227166 | 0 | 0 | 0 |

<!-- These are the header links -->
[version-image]: https://img.shields.io/badge/Version-2.1.0-brightgreen?style=for-the-badge&logo=appveyor
[version-url]: https://github.com/thrackle-io/forte-rules-engine


