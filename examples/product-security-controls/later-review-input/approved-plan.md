# Approved Plan Input: Asteria Cloud FY2027

## Information State

この文書は、後日レビューの動作確認に使う架空の承認済みPlanである。実在組織のDecisionまたはEvidenceではない。

```text
Evidence Status: Synthetic
Authority: Synthetic Product Steering Committee
Approval Date: 2026-09-15
```

## EX-OBJ-001 Trusted CI Execution

### Business Alignment

- Company Goals: CG-003 Delivery Speed, CG-004 Customer Trust
- Organization Goal: OG-001 Standard Delivery Path

### Expected Business / Risk Outcome

未レビューの外部Workflow codeまたは過剰権限からRelease経路が変更される可能性を抑え、共通Delivery Pathを停止理由が説明可能な状態で運用する。

### Risks / Attack Paths

- EX-AP-001 Mutable CI Dependency Compromise

### Existing Controls

- Branch protection
- CODEOWNERS
- Hosted runner
- Manual production approval

### Control References

- PSB-CICD-001
- PSB-CICD-004
- PSB-CICD-005

### KPI

#### EX-KPI-001 Mutable external workflow reference count

- Measurement mode: count
- Unit: references
- Baseline: 11
- Target: 0
- Target date: 2026-12-15
- Evidence: Reviewed workflow inventory bound to repository revision
- Owner: Synthetic CI Platform Lead

#### EX-KPI-002 Privileged workflow without approved exact permission map count

- Measurement mode: count
- Unit: workflows
- Baseline: 9
- Target: 0
- Target date: 2027-01-15
- Evidence: Workflow permission decision records and negative test output
- Owner: Synthetic CI Platform Lead

#### EX-KPI-003 Untrusted PR boundary state

- Measurement mode: state
- Baseline: Evidence Missing
- Target: Every fork-triggered path is reviewed; untrusted code executes without credential; privileged processing starts only from a separate trusted event; negative tests are accepted
- Target date: 2027-01-15
- Evidence: Architecture review, workflow snapshot, credential absence test, privileged handoff test
- Owner: Synthetic Product Security Lead

### Residual Risk

Full commit SHAへ固定した外部code自体の脆弱性、承認済み権限のsemantic error、trusted reviewer identityの侵害は残る。

## EX-OBJ-002 Explainable Dependency Change Decisions

### Business Alignment

- Company Goal: CG-003 Delivery Speed
- Organization Goals: OG-001 Standard Delivery Path, OG-003 Sustainable Security Decisions

### Expected Business / Risk Outcome

Dependency変更を一律停止せず、変更差分、Risk Evidence、承認、例外を同じDecisionへ結び付け、判断不能状態を安全状態と誤認しない。

### Risks / Attack Paths

- EX-AP-002 Malicious Dependency Adoption

### Existing Controls

- SCA scanner
- Dependabot
- CODEOWNERS

### Control References

- PSB-DEPS-001
- PSB-DEPS-004
- PSB-GOV-002

### KPI

#### EX-KPI-004 Dependency change decision state

- Measurement mode: state
- Baseline: Reviewerごとに判断方法が異なり、Evidence取得失敗時の扱いが未定義
- Target: Exact dependency delta、advisory completeness、source、license、provenance、独立承認、期限付き例外が一つのDecisionに結び付き、評価不能はRelease候補にならない
- Target date: 2027-01-31
- Evidence: Decision contract、secure／negative test、sample PR decision receipt
- Owner: Synthetic Product Security Lead

#### EX-KPI-005 Dependency change decision elapsed business days

- Measurement mode: duration
- Unit: business days
- Baseline: 4
- Target: 2
- Target date: 2027-03-31
- Evidence: Pull request opened time and final dependency decision time
- Owner: Synthetic Product Engineering Manager

#### EX-KPI-006 Execution contexts permitting direct public registry access count

- Measurement mode: count
- Unit: execution contexts
- Baseline: 2
- Target: 0
- Target date: 2027-01-31
- Evidence: Developer profile and CI egress policy verification
- Owner: Synthetic Platform Engineering Lead

### Residual Risk

Cooldown経過後のmalicious release、advisory未登録のcode、private package compromise、approved proxy自体の侵害は残る。

## EX-OBJ-003 Traceable Release and Bounded Exceptions

### Business Alignment

- Company Goals: CG-002 Regional Expansion, CG-004 Customer Trust
- Organization Goals: OG-002 Trusted Release, OG-003 Sustainable Security Decisions

### Expected Business / Risk Outcome

Release artifact、Provenance、SBOM、Deployment、Security Exceptionを、顧客説明、影響調査、Rollback判断に利用できるEvidenceとして追跡する。

### Risks / Attack Paths

- EX-AP-003 Untraceable Artifact Replacement
- EX-AP-004 Permanent Security Bypass

### Existing Controls

- Hosted build platform
- Source-only SBOM generation
- Manual release approval
- Distributed issue-based exceptions

### Control References

- PSB-BUILD-003
- PSB-REL-003
- PSB-GOV-002

### KPI

#### EX-KPI-007 Release evidence traceability state

- Measurement mode: state
- Baseline: Source-only SBOMは存在するがArtifactとDeploymentへのbinding EvidenceはMissing
- Target: 対象2 Release lineについてSource revision、platform-generated Provenance、Artifact digest、Build SBOM、Deployment IDを第三者が再現可能なEvidenceで追跡できる
- Target date: 2027-02-28
- Evidence: Signed provenance receipt、Artifact manifest、SBOM processing receipt、Deployment observation
- Owner: Synthetic Release Engineering Lead

#### EX-KPI-008 Security exception without exact expiry count

- Measurement mode: count
- Unit: exceptions
- Baseline: 3
- Target: 0
- Target date: 2026-12-31
- Evidence: Complete exception register and evaluation output
- Owner: Synthetic Product Security Lead

### Residual Risk

Build platform compromise、SBOM component omission、runtime差分、approval system侵害、信頼時刻の障害は残る。

## Initiatives

| Initiative | Objectives | Control references | Decision status |
|---|---|---|---|
| EX-INIT-001 Repository-owned CI policy Pilot | EX-OBJ-001 | PSB-CICD-001, PSB-CICD-004, PSB-CICD-005 | Approved |
| EX-INIT-002 Dependency decision contract Pilot | EX-OBJ-002 | PSB-DEPS-001, PSB-DEPS-004, PSB-GOV-002 | Approved |
| EX-INIT-003 Release evidence chain Pilot | EX-OBJ-003 | PSB-BUILD-003, PSB-REL-003 | Approved |
| EX-INIT-004 Time-bound exception register Pilot | EX-OBJ-002, EX-OBJ-003 | PSB-GOV-002 | Approved |
