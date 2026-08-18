# Security Strategy OS Operating Model

## Status

Interim operating model. 組織固有の担当者とDecision Authorityは未確定であり、`registers/unknowns.yaml` の解決後に承認する。

## Purpose

入力と更新の責任が曖昧なまま情報が陳腐化し、実際の意思決定に使われなくなるリスクを低減する。

```text
Role未割当
→ Input / Evidenceが更新されない
→ Objectiveと現実が乖離する
→ 誤った継続・中止・リスク受容判断
→ 事業目標の阻害または説明責任の喪失
```

## Roles

| Role | Accountability | Assignment |
|---|---|---|
| Input Owner | 企業・組織目標、重点施策、制約、出典の正確性 | Unknown |
| Objective Owner | Objectiveの成果、KPI実績、Evidenceの更新 | Objectiveごとに指定 |
| Risk Owner | 対象リスクとResidual Riskの扱い | Riskごとに指定 |
| Evidence Owner | データソース、測定方法、鮮度の維持 | KPIごとに指定 |
| Repository Maintainer | 構造、台帳、参照整合性、レビュー運用 | Unknown |
| Decision Authority | Objective承認、優先順位、Risk Acceptance、`main`反映 | Unknown |

Role名は責務を示すもので、現時点の組織構造や担当者を表すFactではない。

## Minimum Decision Gates

### Gate 1: Input Accepted

- 企業・組織目標の出典とInput Ownerが記載されている
- Fact / Unknown / Assumptionが区別されている
- 重大な不足情報が`registers/unknowns.yaml`に登録されている

### Gate 2: Objective Approved

- 企業目標と組織目標への接続が説明されている
- 対象RiskとAttack Pathが明示されている
- Existing Controlを評価している
- KPIのBaseline、Target、Owner、Evidenceが定義されている
- Residual RiskとDecision Authorityが明示されている

### Gate 3: Results Accepted

- KPI ActualとEvidence cut-off dateが記載されている
- VarianceとCauseが区別されている
- Business / Risk Outcomeの変化を評価している
- Evidence不足を達成扱いしていない

### Gate 4: Next-year Decision

- Continue / Change / Stop / Complete / Holdの理由がある
- 次年度提言が企業・組織目標と対象Riskへ接続されている
- 新しいAssumption、Unknown、Residual Riskが明示されている
- Decision Authorityの承認Evidenceがある

## Cadence

| Timing | Minimum action |
|---|---|
| 年度・期初 | Planning Input、Objective、KPIを作成・承認する |
| 月次またはデータ更新時 | KPI ActualとEvidenceを更新する |
| 四半期 | 重大な差異、Risk、Assumption、Unknownを確認する |
| 半期・年度末 | 実績評価と次期提言を作成する |
| 重大な事業・脅威変化時 | `scenario/*`で影響を再評価する |

実際の頻度は事業サイクルとデータ取得可能性に合わせて決定する。

## Residual Risk

この運用モデルは責務を定義するが、実際の担当者、承認権限、強制力は未確定である。Roleが割り当てられるまで、未更新情報と未承認判断が`main`に残るリスクは解消しない。
