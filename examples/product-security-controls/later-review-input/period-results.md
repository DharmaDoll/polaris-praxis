# Period Results Input: Asteria Cloud FY2027 H1

## Information State

この文書は、次期・次年度提言の動作確認に使う架空の実績入力である。

```text
Evidence Status: Synthetic
Evidence Cut-off Date: 2027-03-31
Organization Applicability: Not assessed
```

## Input Owner

Synthetic role: Product Strategy Operations

## Business / Organization Changes

- 新地域のうち1地域について、顧客受入開始が2027-02-15から2027-01-20へ前倒しされた
- Enterprise顧客2社から、Release artifactとSBOMの関係を説明する追加要求があった
- Product Security Engineer 1名が期中20営業日、Incident対応へ再配置された

## KPI Results

### EX-KPI-001 Mutable external workflow reference count

- Baseline: 11
- Target: 0
- Actual: 0
- Measurement mode: count
- Evidence: `SYN-EV-H1-001` workflow inventory at reviewed full repository revisions
- Variance: Target achieved
- Cause: 共通Workflowへの移行とRepository checkを同じ変更で実施

### EX-KPI-002 Privileged workflow without approved exact permission map count

- Baseline: 9
- Target: 0
- Actual: 2
- Measurement mode: count
- Evidence: `SYN-EV-H1-002` permission decision inventory
- Variance: Target not achieved; 2 workflows remain
- Cause: 新地域Releaseの前倒しによりDeployment workflowのsemantic reviewを延期

### EX-KPI-003 Untrusted PR boundary state

- Baseline: Evidence Missing
- Target: Reviewed separation and accepted negative tests
- Actual: Target state achieved for the 3 identified fork-triggered workflows
- Measurement mode: state
- Evidence: `SYN-EV-H1-003` architecture decision and credential isolation negative tests
- Variance: No variance within identified scope
- Cause: Hosted unprivileged jobとtrusted follow-up jobへ処理を分割

### EX-KPI-004 Dependency change decision state

- Baseline: Inconsistent reviewer-specific decision
- Target: Exact delta and complete Risk Evidence are bound; evaluation error blocks the decision
- Actual: 12 repositories enforce the target state; 6 repositories remain advisory-only
- Measurement mode: state
- Evidence: `SYN-EV-H1-004` policy bundle, decision receipts, negative tests
- Variance: Target state not achieved for the full approved scope
- Cause: 2種類のPackage Manager adapterでtransitive edge normalizationが未完了

### EX-KPI-005 Dependency change decision elapsed business days

- Baseline: 4
- Target: 2
- Actual: 3
- Measurement mode: duration
- Evidence: `SYN-EV-H1-005` pull request and decision timestamps
- Variance: Target not achieved; actual exceeds target by 1 business day
- Cause: Independent reviewerの割当が週次Batchになっていた

### EX-KPI-006 Execution contexts permitting direct public registry access count

- Baseline: 2
- Target: 0
- Actual: 0
- Measurement mode: count
- Evidence: `SYN-EV-H1-006` developer profile and CI egress test
- Variance: Target achieved
- Cause: Managed proxy profileを端末管理とHosted Runner templateへ適用

### EX-KPI-007 Release evidence traceability state

- Baseline: Source-only SBOM; artifact and deployment binding Evidence Missing
- Target: 2 Release lines have reproducible Source-to-Deployment Evidence
- Actual: 1 Release line satisfies the state criteria; the second has valid Provenance but SBOM processing receipt is incomplete
- Measurement mode: state
- Evidence: `SYN-EV-H1-007` release manifests and `SYN-EV-H1-008` incomplete processing receipt
- Variance: Target state not achieved
- Cause: SBOM processing completion eventのadapterがtimeoutを完了として保存していた

### EX-KPI-008 Security exception without exact expiry count

- Baseline: 3
- Target: 0
- Actual: 0
- Measurement mode: count
- Evidence: `SYN-EV-H1-009` complete exception register evaluation
- Variance: Target achieved
- Cause: 既存例外をexact scope、独立承認、期限付きrecordへ移行

## Initiative Results

| Initiative | Planned | Actual | Evidence | Observed Risk Impact |
|---|---|---|---|---|
| EX-INIT-001 | CI policy Pilot | 4 repositoryで完了 | SYN-EV-H1-001..003 | EX-AP-001のmutable reference経路はPilot scopeで遮断。Permission review gapは残存 |
| EX-INIT-002 | Dependency decision Pilot | 12 repositoryでenforced、6 repositoryでadvisory | SYN-EV-H1-004..006 | Public registry迂回は遮断。Adapter gapによりDecisionの一貫性は未達 |
| EX-INIT-003 | 2 Release lineのEvidence chain | 1件accepted、1件incomplete | SYN-EV-H1-007..008 | 1 Release lineは影響調査可能。Incomplete receiptをcleanと誤認する経路が残存 |
| EX-INIT-004 | Time-bound exception register | 6件を共通台帳へ移行 | SYN-EV-H1-009 | 無期限例外は解消。1件のinvalid recordがGateでblockされた |

## Material Risk / Attack Path Changes

- EX-AP-001: Mutable referenceはPilot scopeで解消したが、2 privileged workflowのpermission decisionが残る
- EX-AP-002: Public registry direct pathは遮断したが、adapter未対応repositoryではadvisory-only
- EX-AP-003: 1 Release lineで追跡可能。Incomplete SBOM receiptをclean扱いするfailure pathが実装レビューで発見された
- EX-AP-004: 無期限例外は解消。承認systemとGit repositoryを同時に変更できるidentityの分離はUnknown

## Assumptions Invalidated

- `SYN-ASM-001`: Hosted build platformのSBOM upload受付は処理完了を意味する
  - Result: Invalidated
  - Evidence: SYN-EV-H1-008
- `SYN-ASM-002`: 既存Package Manager adapterは同じdependency graph semanticsを提供する
  - Result: Invalidated
  - Evidence: SYN-EV-H1-004

## Unknowns Resolved / Discovered

- Resolved: Fork PR 3件のcredential到達経路
- Resolved: DeveloperとCIからのPublic registry direct access
- New Unknown: SBOM processor timeout時に顧客向けEvidenceを取り下げるDecision Authority
- New Unknown: Approval systemとexception repositoryのidentity分離方法

## Incident / Near Miss Lessons

- Synthetic Near Miss: SBOM processing timeoutが一時的にsuccessへ正規化された。Release前のnegative testで検出され、Production artifactへの誤ったEvidence付与は発生しなかった
- Business impact: 新地域向けRelease Readiness Reviewが1営業日延長された
- Resilience lesson: Evidence取得失敗を独立したErrorとして扱うことが、誤った顧客説明を防いだ

## Stakeholder Notes for Next-period Analysis

- Delivery速度を維持するため、全repository展開より先にPackage Manager adapterの境界を決めたい
- 2 privileged workflowの権限削減は新地域Release後に再開可能
- 次年度提言はContinue / Change / Stop / Complete / Holdを分け、未達施策の単純継続にしない
- 提言とKPIは`AGENTS.md`のKPI measurement rulesに従う
