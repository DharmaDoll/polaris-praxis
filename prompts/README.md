# Prompt Runbook

Prompts describe analysis and output requirements. They do not grant permission to update authoritative files.

| Use case | Input | Prompt | Draft output | Human gate |
|---|---|---|---|---|
| Initial planning | `context/business/planning-input-<YEAR>-<ORG>.md` and related context | `11-goal-to-kpi.md` | `drafts/<WORKSPACE>/objective-kpi-draft.md` | Gate 1, then Gate 2 |
| Current-state discovery | Relevant `context/` and interview answers | `00-bootstrap-interview.md` | `drafts/<WORKSPACE>/intake-review.md` | Gate 1 |
| Period review | Approved Objectives, KPI Actuals, Evidence, `templates/period-results.md` | `12-results-to-next-year.md` | `drafts/<WORKSPACE>/next-period-recommendation.md` | Gate 3, then Gate 4 |

## Required agent invocation contract

An agent should receive:

- workspace and period
- input file paths
- Prompt and Template paths
- requested output path under `drafts/`
- review scope and prohibited files

The agent must classify claims, identify missing information, preserve Evidence Status and Confidence, run `ruby scripts/validate_repository.rb` when repository files are changed, and stop for human review before changing authoritative files.

