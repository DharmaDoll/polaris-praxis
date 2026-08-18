# MVP Pilot Guide

## Purpose

Security Strategy OS全体を一度に展開せず、1つの重要事業サービスで「目標入力から次期提言まで」が意思決定に役立つかを検証する。

現時点では実運用Evidenceがないため、本PJの組織適合性と効果は未実証である。

```text
Evidence Status: Missing
Confidence: Low
```

## Recommended Scope

- 対象組織: 1組織
- 対象事業サービス: 1サービス
- Company / Organization Goal: 直接関係するものに限定
- Objective: 1〜3件
- Material Risk: 3〜5件以内
- Initiative: 1〜2件
- Review: 1回の期中レビューと1回の期末レビュー

件数は上限の目安であり、組織のFactではない。小さく開始し、意思決定に不要な成果物を増やさない。

## Pilot Flow

1. `templates/planning-input.md`へ企業・組織目標を入力する
2. `prompts/11-goal-to-kpi.md`でObjectiveとKPI案を作る
3. Gate 1とGate 2をレビューし、承認された範囲だけを`main`へ反映する
4. KPI ActualとEvidenceを期中に更新する
5. `templates/period-results.md`へ実績を入力する
6. `prompts/12-results-to-next-year.md`で評価と次期提言を作る
7. Gate 3とGate 4で意思決定する
8. 運用負荷、欠落、誤解、利用された判断を振り返る

## Pilot KPI

Pilot KPIは運用の実用性と追跡性を測るもので、Security Risk低減の証明には使用しない。各Objectiveには別途Business / Risk Outcome KPIを定義する。

| KPI | Measurement mode | Baseline | Target例 |
|---|---|---|---|
| End-to-end decision traceability state | state | 未確認 | 企業目標からDecision Evidenceまで第三者が追跡・再現できる |
| Input acceptedからObjective draftまでの所要営業日 | duration | Unknown | Pilot開始時にDecision Authorityが設定 |
| Critical Unknownの未解決件数 | count | Pilot開始時に測定 | Gateごとに許容件数をDecision Authorityが設定 |
| Evidence Missingのまま判断されたObjective件数 | count | 0 | 0件 |
| 1レビューサイクルの保守作業時間 | duration | Unknown | Pilot終了時に継続可能性を判断できる値を取得 |

Targetを組織Evidenceなしに固定しない。初回PilotではBaseline取得自体を成果とし、その後にDecision AuthorityがTargetを承認する。

## Exit Decision

Pilot終了時に次を決定する。

- Continue: 意思決定に利用され、運用負荷が受容可能
- Change: 価値はあるが入力、KPI、役割、ツールの変更が必要
- Stop: 意思決定に使われない、または維持負荷が価値を上回る
- Hold: Evidence不足で判断不能

判断根拠、Evidence、Residual Risk、再検討条件をDecision Recordに保存する。
