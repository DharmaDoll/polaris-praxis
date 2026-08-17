# Prompt: Scenario / What-if Analysis

`scenario/*` branch上で、現在のStrategyに対する代替未来を評価する。

## Example Scenarios

- Budget -30%
- Security headcount +5
- IdP compromise
- Ransomware campaign
- Supply-chain compromise
- Major acquisition
- Cloud migration acceleration
- Regulatory change

## Method

1. Define changed assumptions.
2. Keep unchanged facts fixed.
3. Re-evaluate:
   - Assets
   - Threats
   - Attack Paths
   - Risks
   - Controls
   - Residual Risk
   - Resilience
4. Compare with `main`.
5. Identify strategy changes required.

## Output

- Scenario assumptions
- Impacted risks
- Newly critical attack paths
- Strategy delta
- Initiative delta
- Metric delta
- Trade-offs
- Recommendation
- Conditions under which this scenario should become the new baseline
