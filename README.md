# Security Strategy OS

組織のセキュリティ戦略を、Business / Asset / Threat / Attack Path / Risk / Control / Residual Risk / Resilience の連鎖で設計・運用し、年度・半期の計画、予実、判断根拠、証跡までGitHub上で追跡するための中枢リポジトリ。

## Core Model

```text
Company Vision / Values / Annual Goals
        ↓
Organization Mission / Annual / Period Goals / Priority Initiatives
        ↓
Business / Mission
        ↓
Asset / Crown Jewel
        ↓
Threat
        ↓
Attack Path
        ↓
Risk
        ↓
Control
        ↓
Residual Risk
        ↓
Resilience
        ↓
Strategy / Roadmap / Initiative
        ↓
Execution
        ↓
KPI / Evidence
        ↓
Actuals / Review / Next-period Recommendations
        └──────────────────→ Strategy
```

## Repository Principle

> Documents are views. Evidence, structured registers, and decisions are the source.

このリポジトリは「もっともらしいセキュリティ文書を生成する場所」ではない。
事実・未知・仮説・判断・根拠を区別し、組織として説明可能な戦略を継続的に構築する。

## 利用者向けクイックスタート

最初に行うことは、セキュリティ施策を考えることではなく、企業・組織の目標を一つの入力にまとめることです。次の流れで、目標から実行可能なSecurity ObjectiveとKPI、後日の次期提言までを作れます。

```text
企業・組織の目標を入力
        ↓
Objective / KPI案を生成
        ↓  人が確認・承認
Strategy / Roadmap / Initiativeとして実行
        ↓  実績・Evidenceを入力
次年度（次期）への提言を生成
```

### 1. 対象を一つに絞る

最初は一つの重要事業サービス、プロダクト、または組織を対象にします。試行だけなら、架空データを含む [`examples/product-security-controls/`](examples/product-security-controls/) を使えます。実データを扱う場合は、`planning/*` ブランチを作成し、`examples/` には保存しません。

### 2. 最小限の目標を入力する

[`templates/planning-input.md`](templates/planning-input.md) を複製し、対象年度・組織名を付けて `context/business/` に保存します。まず次の項目だけを埋めてください。

- 企業・組織のVisionとValues
- 年間目標、対象期の目標
- 重点施策と期限
- 制約（人員、予算、期限、規制など）

分からないことは推測せず `Unknown` と記載します。入力は事実・仮説・判断・Evidenceを区別してください。

### 3. ObjectiveとKPI案を作る

入力ファイルと [`prompts/11-goal-to-kpi.md`](prompts/11-goal-to-kpi.md) をAIまたはレビュー担当者に渡します。最初の出力として、通常は次の成果物が得られます。

- 企業・組織目標に紐づくSecurity Objective（通常1〜5件）
- 各Objectiveを測るKPI（定性的な目標も観測可能な状態・期限・Evidenceに変換）
- Business / Asset / Threat / Attack Path / Risk / Control Gapのつながり
- 不足情報（`registers/unknowns.yaml` に登録する質問）
- 提案した施策、責任者、期限、残余リスク、必要なEvidence

KPIは件数・日数・日時・金額・絶対量・状態などで表し、割合（`%`、率、比率など）は使いません。AIの出力自体はEvidenceではないため、承認前のドラフトとして扱います。

### 4. 人が確認し、台帳と計画に反映する

ObjectiveとKPIの妥当性、対象リスク、既存Control、残余リスク、責任者をレビューします。合意した内容だけを `registers/objectives.yaml`、`registers/kpis.yaml` と `strategy/`・`roadmap/`・`initiatives/` の成果物へ反映してください。不足情報は `registers/unknowns.yaml` に残します。

変更前に次の検証を実行します。

```bash
ruby scripts/validate_repository.rb
```

### 5. 実績を入力し、次期提言を得る

期末またはレビュー時に [`templates/period-results.md`](templates/period-results.md) へ実績、未達理由、Decision、Evidenceを入力します。[`prompts/12-results-to-next-year.md`](prompts/12-results-to-next-year.md) を使うと、Objectiveごとに **Continue / Change / Stop / Complete / Hold** の判断、次期Objective・KPI案、根拠、信頼度、残余リスク、追加確認事項が得られます。

詳細な入力項目、レビューゲート、出力スキーマは [`docs/USER_GUIDE_AND_SPECIFICATION.md`](docs/USER_GUIDE_AND_SPECIFICATION.md)、最初の試行計画は [`docs/PILOT_GUIDE.md`](docs/PILOT_GUIDE.md)、実装チェックリストは [`plan.md`](plan.md) を参照してください。

## Start Here（設計・運用者向け）

1. `AGENTS.md`、[`vision/VISION.md`](vision/VISION.md)、[`vision/PRINCIPLES.md`](vision/PRINCIPLES.md) を確認する
2. 詳細仕様とPilot手順を読む
3. 上記クイックスタートで一つの対象を最後まで通す
4. MVP後の拡張候補は [`docs/DEFERRED_REQUIREMENTS.md`](docs/DEFERRED_REQUIREMENTS.md) で管理する

## Sample Data

`examples/product-security-controls/`に、架空企業の企業・組織目標、Product Security Current State、承認済みPlan、後日実績のサンプルがある。`examples/`配下はすべてSyntheticかつ非正本であり、rootの台帳・戦略・Evidenceへ自動反映しない。

## Branch Model

- `main`: 現在承認されている組織のSecurity Strategy
- `strategy/*`: 次年度・中長期戦略
- `planning/*`: 半期・四半期計画
- `initiative/*`: 大規模施策
- `scenario/*`: What-if / Threat Scenario
- `option/*`: Control / Architecture比較
- `experiment/*`: 指標・Framework・Agent Workflow検証
- `agent/*`: Agentによる大規模ドラフト

原則:

> `main`には「現在の真実」を置き、Branchでは「未来・仮説・選択肢」を扱う。
