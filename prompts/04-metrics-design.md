# Prompt: Design Metrics

Security Strategyの有効性を測定する指標を設計する。

## Metric Hierarchy

1. Business Outcome
2. Risk Outcome
3. Security Capability
4. Activity

## For Each Metric

- Name
- Type: KPI / KRI / KR / Leading / Lagging
- Strategic Objective
- Risk
- Definition
- Formula / Measurement method
- Data source
- Baseline
- Target
- Frequency
- Owner
- Caveats
- Gaming risk
- Evidence location

## Mandatory KPI Output

- すべてのStrategic ObjectiveとInitiativeに、少なくとも1つのKPIを定義する。
- KRI、KR、Leading、Laggingの各指標を併用する場合でも、KPIは省略しない。
- 定性的な成果が適切な場合も、観測可能な状態、判定条件、期限を持つKPIとして表現する。
- KPIのMeasurement modeを、`count`、`duration`、`date`、`amount`、`absolute-quantity`、`state`のいずれかで明示する。
- `state`を使う場合は、各状態の名称と、第三者が同じ結論を再現できるEvidence条件を定義する。

## Rules

- Activity metricだけで「改善した」と判断しない。
- KPIに割合、パーセント、率、比率、分数表現を使用しない。
- Coverage rate、achievement rate、compliance rate、detection rate等をKPIにしない。
- 母集団が重要な場合は、対象総数と条件を満たす件数を別々の絶対値として記録し、除算しない。
- 定量化のために根拠のないスコアを作らない。
- 検知件数の増加を単純に悪化と解釈しない。
- 指標のGoodhart's Lawリスクを確認する。
- 可能ならAttack Path / Crown Jewel単位のRisk Outcomeを優先する。
