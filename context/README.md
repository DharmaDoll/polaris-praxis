# Context Input Contract

`context/` is the user-owned input area for one organization and one planning workspace. It is not a general document dump and it is not a substitute for Evidence storage systems.

## Scope

- One repository should represent one approved organizational workspace unless a separate data-isolation decision says otherwise.
- `context/manifest.yaml` identifies the organization, period, owners, classification, and workspace status.
- `context/business/` contains Company / Organization goals, Values, Priority Initiatives, and Constraints.
- `context/organization/` contains organization mission, mandate, structure, and decision context.
- `context/assets/` contains relevant services, assets, and Crown Jewels.
- `context/architecture/` contains architecture or dependency context needed for attack-path reasoning.
- `context/constraints/` contains budget, capacity, regulatory, contractual, and timing constraints.

## Input Rules

1. Use one planning input file per organization and period, for example `business/planning-input-2026-org-a.md`.
2. Label material claims as `Fact`, `Unknown`, `Assumption`, `Hypothesis`, `Decision`, or `Evidence`.
3. Record source, owner, review date, and classification where applicable.
4. Do not invent missing organizational facts. Use `Unknown` and register decision-relevant gaps in `registers/unknowns.yaml`.
5. Do not copy values, IDs, Evidence, or Decisions from `examples/`; those files are Synthetic and non-authoritative.
6. Do not store credentials, secrets, unnecessary personal data, or restricted originals in this repository.
7. Keep drafts and unapproved agent output under `drafts/`, not in authoritative registers or approved strategy files.

## Agent Intake Contract

Before analysis, an agent must read:

1. Root `AGENTS.md`
2. `vision/`
3. `context/manifest.yaml`
4. The relevant period's files under `context/`
5. The requested Prompt and Template

The agent must first return its current understanding, missing information, assumptions, and proposed output location. It must not update authoritative files before human review.

## Quick Start intake

簡易計画・簡易レビューでは、利用者は既存資料や会話のメモから始められる。エージェントは上記の既存Contextを参照し、対象・期間・目標・実績・根拠・制約を整理する。部内のチーム・機能を扱う場合は、会社・部門の方針に加え、当該チームの役割・担当範囲・依存先を整理する。資料名だけの参照や自己申告を、確認済みFactとして扱わない。保存が必要な入力整理案は`drafts/`へ置き、人による確認前に`context/`や正本の台帳を更新しない。組織固有の保存先・権限等が未確定でも、共有を許可された情報によるドラフト整理は可能だが、正式運用が承認されたことを意味しない。

