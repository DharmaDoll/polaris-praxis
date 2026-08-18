# Product Security Controls Sample

## Status

```text
Data Classification: Synthetic Example
Authoritative: No
Organization Fact: No
Production Evidence: No
```

架空企業「Asteria Cloud株式会社」の企業・組織目標とProduct Securityの現状を使い、Security ObjectiveとKPIの生成、後日の実績レビュー、次年度提言までを試すサンプルである。実在する企業、人物、システム、顧客、インシデントを表さない。

## External Reference

- Repository: [DharmaDoll/product-security-controls](https://github.com/DharmaDoll/product-security-controls)
- Reviewed source revision: [`3738f6fdeabcbc1b275c046a33fb727fcd97ef9d`](https://github.com/DharmaDoll/product-security-controls/commit/3738f6fdeabcbc1b275c046a33fb727fcd97ef9d)
- Reviewed at: 2026-08-18
- Usage: control ID、対象リスク、成功状態、残余リスクを設計上の参照座標として利用
- Non-usage: 外部リポジトリのコード、fixture、チェックリストをこのサンプルへ複製しない

参照時点のcatalogは47 controls / 436 atomic checksを掲載している。本サンプルは網羅導入を目的とせず、次の8 controlだけを候補として扱う。

| Control | Sampleで扱う観点 |
|---|---|
| [PSB-DEPS-001](https://github.com/DharmaDoll/product-security-controls/tree/3738f6fdeabcbc1b275c046a33fb727fcd97ef9d/controls/dependency-security/release-cooldown) | 公開直後dependencyとregistry迂回 |
| [PSB-DEPS-004](https://github.com/DharmaDoll/product-security-controls/tree/3738f6fdeabcbc1b275c046a33fb727fcd97ef9d/controls/dependency-security/dependency-change-review) | Dependency差分のRisk Review |
| [PSB-CICD-001](https://github.com/DharmaDoll/product-security-controls/tree/3738f6fdeabcbc1b275c046a33fb727fcd97ef9d/controls/cicd-security/action-sha-pinning) | GitHub Actions参照の不変化 |
| [PSB-CICD-004](https://github.com/DharmaDoll/product-security-controls/tree/3738f6fdeabcbc1b275c046a33fb727fcd97ef9d/controls/cicd-security/actions-least-privilege) | Workflow tokenの最小権限 |
| [PSB-CICD-005](https://github.com/DharmaDoll/product-security-controls/tree/3738f6fdeabcbc1b275c046a33fb727fcd97ef9d/controls/cicd-security/untrusted-pr-boundary) | 未信頼PRと権限処理の分離 |
| [PSB-BUILD-003](https://github.com/DharmaDoll/product-security-controls/tree/3738f6fdeabcbc1b275c046a33fb727fcd97ef9d/controls/build-security/platform-provenance-generation) | Build platform由来provenance |
| [PSB-REL-003](https://github.com/DharmaDoll/product-security-controls/tree/3738f6fdeabcbc1b275c046a33fb727fcd97ef9d/controls/release-integrity/sbom-binding-publication) | Artifactに結び付いたSBOM lifecycle |
| [PSB-GOV-002](https://github.com/DharmaDoll/product-security-controls/tree/3738f6fdeabcbc1b275c046a33fb727fcd97ef9d/controls/governance-operations/time-bound-security-exceptions) | 狭いscope、独立承認、期限付き例外 |

## Files

| Path | Purpose |
|---|---|
| `input/planning-input.md` | 初回の企業・組織目標入力 |
| `input/product-security-current-state.md` | 資産、脅威、Attack Path、既存Control、Gapの入力 |
| `later-review-input/approved-plan.md` | 後日レビュー用の架空の承認済みObjective / KPI |
| `later-review-input/period-results.md` | 後日投入する架空の実績とEvidence |
| `generated/` | AIが生成したサンプル出力だけを置く場所 |

## Run Initial Planning

AIエージェントへ次を依頼する。

```text
Read AGENTS.md, prompts/11-goal-to-kpi.md,
examples/product-security-controls/input/planning-input.md, and
examples/product-security-controls/input/product-security-current-state.md.
Treat every example value as Synthetic, not as an organizational Fact.
Write proposed outputs only under examples/product-security-controls/generated/planning/.
Do not update root context/, registers/, strategy/, roadmap/, initiatives/, metrics/, or evidence/.
```

## Run Later Review

```text
Read AGENTS.md, prompts/12-results-to-next-year.md,
examples/product-security-controls/later-review-input/approved-plan.md, and
examples/product-security-controls/later-review-input/period-results.md.
Treat every example value as Synthetic, not as an organizational Fact.
Write proposed outputs only under examples/product-security-controls/generated/review/.
Do not update root registers/, strategy/, roadmap/, initiatives/, metrics/, reviews/, or evidence/.
```

## Expected Behavior

- 企業・組織目標との関係が説明できるSecurity Objectiveだけを出力する
- ObjectiveとInitiativeにKPIを設定する
- KPIに割合、パーセント、率、比率、分数表現を使わない
- Control導入自体をObjectiveにしない
- Existing Controlを評価してからControl Gapを示す
- Control候補ごとに対象Risk、Attack Path、期待成果、Residual Riskを示す
- EvidenceがSyntheticであるため、実組織への推奨または導入済み判定を行わない
