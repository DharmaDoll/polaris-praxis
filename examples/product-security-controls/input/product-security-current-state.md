# Product Security Current State: Asteria Cloud FY2027

## Information State

```text
Evidence Status: Synthetic
Confidence: Medium within the fictional scenario
Organization Applicability: Not assessed
```

数値、構成、Risk、Control状態はすべて架空である。

## Business / Mission Impact

Asteria FlowのRelease integrityが説明できない、またはCI/CDを起点に侵害された場合、Enterprise契約、2地域への展開、顧客取引の継続、監査対応が影響を受ける。

## Assets

| Asset | Intrinsic Value | Path / Positional Value | Operational Value |
|---|---|---|---|
| Customer transaction data | High: 顧客取引情報 | Medium: 他資産への経路は限定 | High: Asteria Flow提供に必須 |
| GitHub organization | Medium: SourceとIssue | High: CI、Build、Release変更の起点 | High: 全Product teamが利用 |
| GitHub Actions workflows | Low: 定義ファイル自体 | High: Token、Artifact、Deploymentへの実行経路 | High: Releaseに必須 |
| Hosted build platform | Medium: Build metadata | High: Release artifactとProvenance生成点 | High: Production releaseに必須 |
| Artifact registry | High: Release artifact | High: Production deploymentへの供給点 | High: Rollbackと復旧に必須 |
| Dependency proxy | Low: Cacheとmetadata | High: 開発端末とBuildへのSoftware供給経路 | High: Build継続に必要 |

## Architecture Summary

```text
Developer / Dependency Bot
→ GitHub Pull Request
→ GitHub Actions Hosted Runner
→ Hosted Build Platform
→ Artifact Registry
→ Deployment Pipeline
→ Production
```

Trust boundaries:

- 外部GitHub Action／reusable workflowとrepository-owned workflowの境界
- Public package registryとmanaged dependency経路の境界
- Untrusted pull request codeとcredentialを持つjobの境界
- Tenant build stepとbuild platform control planeの境界
- Release artifact、SBOM、Deployment observationの同一性境界

## Synthetic Evidence Summary

| Evidence ID | Observation |
|---|---|
| SYN-EV-001 | Production関連repositoryは18件 |
| SYN-EV-002 | 外部GitHub Action／reusable workflow参照は26件、そのうちmutable referenceは11件 |
| SYN-EV-003 | 明示的に承認されたexact permission mapを持たないprivileged workflowは9件 |
| SYN-EV-004 | Fork由来PRを扱うworkflowは3件、credential分離EvidenceはMissing |
| SYN-EV-005 | 前期のDependency変更PRは46件、独立Reviewer Evidenceがあるものは31件 |
| SYN-EV-006 | 開発端末からPublic registryへの直接通信が可能 |
| SYN-EV-007 | Build artifactへの署名済みProvenanceは未導入 |
| SYN-EV-008 | Source treeから生成したSBOMは4 Release lineに存在するが、Artifact digestとのbinding EvidenceはMissing |
| SYN-EV-009 | Security Exceptionは6件、期限がないものは3件、自己承認は1件 |
| SYN-EV-010 | 既存SCA scannerは18 repositoryで稼働するが、scanner error時のRelease Gate動作はUnknown |

母集団と該当件数は別々の絶対値として記録し、割合へ変換しない。

## Threats and Attack Paths

### EX-AP-001 Mutable CI Dependency Compromise

```text
Upstream Action maintainer compromise or tag movement
→ mutable workflow reference resolves to changed code
→ code executes with repository or OIDC permission
→ source, artifact, or deployment is modified
→ customer trust and regional launch are impacted
```

Relevant control references: `PSB-CICD-001`, `PSB-CICD-004`, `PSB-CICD-005`.

### EX-AP-002 Malicious Dependency Adoption

```text
Maintainer or registry compromise
→ newly published dependency is selected
→ install or build code executes on developer or CI identity
→ credential theft or artifact modification
→ release delay, investigation, or customer impact
```

Relevant control references: `PSB-DEPS-001`, `PSB-DEPS-004`.

### EX-AP-003 Untraceable Artifact Replacement

```text
Build misconfiguration or compromised build step
→ artifact and metadata are generated from different inputs
→ source-only or mismatched SBOM is accepted
→ incorrect artifact reaches deployment
→ impact analysis and recovery decisions use unreliable inventory
```

Relevant control references: `PSB-BUILD-003`, `PSB-REL-003`.

### EX-AP-004 Permanent Security Bypass

```text
Release deadline pressure
→ broad or self-approved exception is created
→ exception has no exact scope or expiry
→ failed security gate remains bypassed
→ known exposure persists into later releases
```

Relevant control reference: `PSB-GOV-002`.

## Existing Controls

| Existing Control | Current Evidence | Strength | Gap |
|---|---|---|---|
| Branch protection | 18 repositoryの設定snapshot | Direct pushを制限 | Workflow dependencyと権限は評価対象外 |
| CODEOWNERS | 12 repositoryでSecurity-sensitive pathを指定 | Reviewer routingを補助 | 独立承認の完了Evidenceは不統一 |
| SCA scanner | 18 repositoryのjob結果 | Known vulnerability検出 | Dependency delta、provenance、scanner error semanticsが不明 |
| Dependabot | 14 repositoryで有効 | Update作成を自動化 | Cooldown、registry固定、非Author承認は未確認 |
| Hosted runner | 全Production workflowで利用 | Persistent self-hosted runner exposureを回避 | Token権限とuntrusted PR境界は別途確認が必要 |
| Manual release approval | Production environmentで1名承認 | 誤Releaseを抑制 | Artifact identity、Provenance、SBOMの照合Evidenceがない |

## Control Candidate Assessment

External referenceの`prototype`、`adopted`、Evidence levelは、この架空組織への導入状態を意味しない。

| Control | Risk / Attack Path | Current State | Control Gap | Expected Contribution | Residual Risk |
|---|---|---|---|---|---|
| PSB-CICD-001 | EX-AP-001 | Mutable reference 11件 | Full commit SHAとadvisory evaluationが未強制 | Prevent / Verify | 固定済みcode自体の悪性・脆弱性 |
| PSB-CICD-004 | EX-AP-001 | Exact permission未承認workflow 9件 | Job目的、trusted ref、environmentとのbinding不足 | Prevent / Verify | 承認した権限自体のsemantic error |
| PSB-CICD-005 | EX-AP-001 | Credential分離Evidence Missing | Untrusted codeとprivileged processingの境界不明 | Prevent / Verify | Trusted workflowやreviewer identityの侵害 |
| PSB-DEPS-001 | EX-AP-002 | Public registry direct access可能 | Managed proxy、cooldown、fail-closed metadata evaluationなし | Prevent / Verify | 観測期間経過後のmalicious dependency |
| PSB-DEPS-004 | EX-AP-002 | Independent review Evidence 31件 | Exact dependency deltaと完全なRisk Evidenceのbinding不足 | Prevent / Detect / Verify | Advisory未登録のmalicious code |
| PSB-BUILD-003 | EX-AP-003 | Provenance未導入 | Platform-owned automatic provenanceなし | Prevent / Verify | Build platform自体の侵害 |
| PSB-REL-003 | EX-AP-003 | Source-only SBOM 4件 | Exact artifact、publication、processing、deploymentとのbinding不足 | Detect / Verify / Govern | SBOM component omissionとruntime差分 |
| PSB-GOV-002 | EX-AP-004 | 無期限3件、自己承認1件 | Exact scope、独立承認、期限、complete register不足 | Verify / Respond / Govern | Approval system侵害と実環境Gate未強制 |

## Resilience Considerations

- Prevent: immutable dependency、least privilege、managed dependency経路
- Detect: Dependency delta、SBOM processing、exception register integrity
- Respond: 期限切れ例外の停止、影響Artifact／Deploymentの特定
- Recover: 信頼できるArtifact identityとSBOMを使ったRollback判断

Recovery手順、RTO、RPO、代替Build経路のEvidenceはMissingであり、Control導入後も別のResidual Riskとして残る。

## Unknowns Blocking Final Recommendations

- Fork PRがcredentialへ到達できるか
- GitHub organization policyで強制可能な設定範囲
- Hosted build platformが生成可能なProvenance形式とtrust boundary
- Dependency proxyの障害時挙動
- SBOMの正本、保持期間、顧客提供範囲
- Security ExceptionのRisk OwnerとDecision Authority
