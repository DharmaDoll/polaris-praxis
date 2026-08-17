# Security Strategy OS

組織のセキュリティ戦略を、Business / Asset / Threat / Attack Path / Risk / Control / Residual Risk / Resilience の連鎖で設計・運用し、年度・半期の計画、予実、判断根拠、証跡までGitHub上で追跡するための中枢リポジトリ。

## Core Model

```text
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
Metrics / Evidence
        ↓
Review / Adapt
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
4. `context/` に現状情報を投入する
5. `registers/unknowns.yaml` に不足情報を記録する
6. Codexに `prompts/00-bootstrap-interview.md` を与える
7. 対話でCurrent Stateを形成する
8. `strategy/`, `roadmap/`, `initiatives/` に成果物を作る

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
