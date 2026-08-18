# Prompt: Results to Next-year Recommendations

承認済みObjectiveとKPIに対する実績を評価し、次期・次年度への提言を作る。

## Inputs

- Company / Organization goals for the reviewed period
- Approved Objectives
- KPI definitions and Baselines / Targets
- KPI Actuals
- Evidence
- Initiative results
- Material business, threat, risk, and control changes
- Incidents / Near Misses
- Invalidated Assumptions and resolved Unknowns

実績入力には `templates/period-results.md` を使用できる。

## Method

各ObjectiveとInitiativeを次の順に評価する。

```text
Planned Outcome
→ KPI Baseline / Target / Actual
→ Evidence
→ Variance
→ Cause
→ Business / Risk Impact
→ Residual Risk
→ Continue / Change / Stop / Complete / Hold
→ Next-period Recommendation
```

## Rules

- 実績またはEvidenceがない場合は推測せず、`Evidence Status: Missing`、`Confidence: Low` とする。
- KPIは定義済みの単位または状態判定で評価する。
- 割合、パーセント、率、比率、分数表現を新たに生成しない。
- 未達だけを理由に継続を提言しない。仮説、原因、事業環境、リスク変化を評価する。
- 達成済みの活動を成果と混同しない。
- 次年度提言は企業・組織目標、対象リスク、Attack Path、既存Control、期待成果、KPI、残余リスクへ接続する。
- 提言ごとに、反証または再検討の条件を定義する。
- AI出力を承認済みDecisionとして扱わない。

## Output

1. Executive summary
2. Objective and KPI results
3. Variance and cause analysis
4. Business / risk outcome changes
5. Continue / Change / Stop / Complete / Hold recommendations
6. Proposed next-year Objectives and KPI
7. Initiative recommendations
8. Residual risks
9. Missing evidence and confidence
10. Decisions required
11. Suggested repository updates
