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

## Start Here

1. `AGENTS.md` を読む
2. `vision/VISION.md` を確認する
3. `vision/PRINCIPLES.md` を確認する
4. `docs/USER_GUIDE_AND_SPECIFICATION.md` で利用手順と現行仕様を確認する
5. `templates/planning-input.md` に企業・組織のVision、Value、年間／期目標、重点施策を入力する
6. Codexに `prompts/11-goal-to-kpi.md` を与え、Security ObjectiveとKPI案を作る
7. `registers/unknowns.yaml` に不足情報を記録する
8. 必要に応じて `prompts/00-bootstrap-interview.md` で詳細なCurrent Stateを形成する
9. `strategy/`, `roadmap/`, `initiatives/`, `metrics/` に承認済み成果物を作る
10. 後日 `templates/period-results.md` に実績を入力し、`prompts/12-results-to-next-year.md` で次期提言を作る

最初は `docs/PILOT_GUIDE.md` に従い、1つの重要事業サービスで一連の流れを検証する。

変更前のローカル検証:

```bash
ruby scripts/validate_repository.rb
```

MVP後の重要な拡張候補は `docs/DEFERRED_REQUIREMENTS.md` で管理する。

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
