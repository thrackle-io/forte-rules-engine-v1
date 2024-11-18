# IApplicationRules
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/c24a67035f9dc2b86d52113e68cb76f2f45fa3f2/src/protocol/economic/ruleProcessor/RuleDataInterfaces.sol)


## Structs
### AccountMaxTxValueByRiskScore
******** Account Max Transaction Value ByRisk Score Rules ********

*maxValue size must be equal to _riskScore
The positioning of the arrays is ascendant in terms of risk scores,
and descendant in the size of transactions. (i.e. if highest risk score is 99, the last balanceLimit
will apply to all risk scores of 100.)*


```solidity
struct AccountMaxTxValueByRiskScore {
    uint48[] maxValue;
    uint8[] riskScore;
    uint16 period;
    uint64 startTime;
}
```

### AccountMaxValueByRiskScore
******** Account Max Value By Risk Score Rules ********


```solidity
struct AccountMaxValueByRiskScore {
    uint8[] riskScore;
    uint48[] maxValue;
}
```

