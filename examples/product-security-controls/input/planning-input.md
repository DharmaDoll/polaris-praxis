# Planning Input: FY2027 Asteria Cloud Product Engineering

## Information State

このファイルの内容はすべて架空の`Synthetic Fact`である。実組織のFactまたはEvidenceとして使用しない。

## Company Profile

- Company: Asteria Cloud株式会社（架空）
- Business: 企業間受発注を扱うマルチテナントSaaS
- Critical service: Asteria Flow
- Planning period: FY2027

## Company Vision

企業間取引の複雑さを減らし、顧客が安心して事業変更を進められる基盤になる。

## Company Values

- Customer trust before short-term convenience
- Evidence before confidence
- Small reversible changes
- Shared ownership

## Company Annual Goals

### CG-001 Enterprise Growth

FY2027末までに、新規Enterprise契約40社を獲得する。

### CG-002 Regional Expansion

2027-01-31までに新しい2地域でAsteria Flowの提供を開始する。

### CG-003 Delivery Speed

顧客要求の承認から本番提供までの中央値を、現状6営業日からFY2027末までに3営業日へ短縮する。

### CG-004 Customer Trust

リリース成果物と本番稼働物について、顧客監査時に同一性と依存関係を説明できる状態を2027-02-28までに確立する。

## Organization Mission / Mandate

Product Engineering組織は、Asteria Flowの設計、開発、Build、Release、運用、およびProduct Securityを共同で担う。

## Organization Annual Goals

### OG-001 Standard Delivery Path

主要18 repositoryの変更を、再現可能でEvidenceを残す共通Delivery Pathへ移行する。

### OG-002 Trusted Release

Source revision、Build、Artifact、SBOM、Deploymentの関係を追跡できる状態を確立する。

### OG-003 Sustainable Security Decisions

Security checkの失敗と例外を、Release速度を不必要に損なわず、Owner、根拠、期限付きで判断できる状態を確立する。

## Period Goals

### H1

- 重要4 repositoryで共通Delivery PathをPilot運用する
- Dependency変更判断とGitHub Actions設定のBaselineを取得する
- 期限付きSecurity ExceptionのDecision Gateを試行する

### H2

- Pilot Evidenceに基づいて対象拡大または設計変更を判断する
- 2つのRelease lineでArtifact、Provenance、SBOMの関係を検証する
- FY2028に継続、変更、中止する施策を決定する

## Priority Initiatives

- PI-001 GitHub Actions共通Workflowと権限設計
- PI-002 Dependency Update ReviewとManaged Registry経路
- PI-003 Build ProvenanceとSBOM lifecycle Pilot
- PI-004 Security Exception Decision Process

これらは承認済みSecurity Controlではなく、企業・組織目標から妥当性を評価する候補である。

## Constraints

- Budget: FY2027 H1は新しい有償Security Platformを購入しない
- Headcount: Product Security Engineer 2名、Platform Engineer 3名をPilotへ割り当て可能
- Engineering capacity: 各Product teamはH1中に合計10営業日まで対応可能
- Deadline: 新地域向けRelease Readiness Decisionは2027-01-15
- Dependencies: GitHub Enterprise、Hosted Runner、既存SCA scannerを継続利用する

## Material Business Changes

- Enterprise顧客からSBOMとRelease integrityに関する説明要求が増えている
- 新地域への展開によりRelease対象environmentが2つ増える
- AI coding agentの利用拡大は別Scenarioで扱い、このPilotのScope外とする

## Previous Results / Lessons

- Previous formal cycle: Not available
- Dependency updateの承認待ちがRelease遅延原因になる事例があったが、共通のCause分類は未導入
- Security Exceptionは複数のIssue trackerに分散し、期限確認が人手に依存している

## Source / Evidence

- `SYN-BOARD-FY2027-PLAN`: 架空の取締役会承認済み事業計画
- `SYN-ENG-H1-PLAN`: 架空のProduct Engineering H1計画
- `SYN-CUSTOMER-AUDIT-NOTES`: 架空の顧客監査要求要約

## Input Owner

Synthetic role: VP Product Engineering

## Review Date

2026-08-18

## Unknowns

- 新地域ごとの規制・契約要求
- Production artifactとdeploymentを現在照合できるEvidence source
- Dependency reviewに許容できる判断所要時間
- Decision Authorityとなる役割
