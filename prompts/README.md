# Prompt Runbook

Prompts describe analysis and output requirements. They do not grant permission to update authoritative files.

| Use case | Input | Prompt | Draft output | Human gate |
|---|---|---|---|---|
| Quick Start: 期末の振り返り | 既存の目標・実績・根拠・次期の制約。会話のメモでも可 | `12-results-to-next-year.md` の簡易レビュー | 会議用の評価案と根拠の補足。保存時は`drafts/<WORKSPACE>/` | 評価案の確認後、正式反映にはGate 3・4 |
| Quick Start: 期初の目標設定 | 会社・組織の方針・目標・現状・制約 | `11-goal-to-kpi.md` の簡易計画 | 会議用の目標案と根拠の補足。保存時は`drafts/<WORKSPACE>/` | 目標案の確認後、正式反映にはGate 1・2 |
| Initial planning | `context/business/planning-input-<YEAR>-<ORG>.md` and related context | `11-goal-to-kpi.md` | `drafts/<WORKSPACE>/objective-kpi-draft.md` | Gate 1, then Gate 2 |
| Current-state discovery | Relevant `context/` and interview answers | `00-bootstrap-interview.md` | `drafts/<WORKSPACE>/intake-review.md` | Gate 1 |
| Period review | Approved Objectives, KPI Actuals, Evidence, `templates/period-results.md` | `12-results-to-next-year.md` | `drafts/<WORKSPACE>/next-period-recommendation.md` | Gate 3, then Gate 4 |

## Required agent invocation contract

通常運用では以下を指定する。Quick Startではエージェントが既存Contextと入力メモから整理し、利用者に技術的な項目の穴埋めを求めない。

An agent should receive:

- workspace and period
- input file paths
- Prompt and Template paths
- requested output path under `drafts/`
- review scope and prohibited files

The agent must classify claims, identify missing information, preserve Evidence Status and Confidence, run `ruby scripts/validate_repository.rb` when repository files are changed, and stop for human review before changing authoritative files.

