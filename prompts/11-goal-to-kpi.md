# Prompt: Business Goals to Security Objectives and KPI

企業と組織の方向性を入力として、具体的なSecurity ObjectiveとKPIを設計する。このプロンプトを通常利用時の入口とする。

## Inputs

- Company Vision
- Company Values
- Company Annual Goals
- Organization Mission / Mandate
- Organization Annual Goals
- Period Goals
- Priority Initiatives
- Constraints
- Previous Results / Lessons（存在する場合）
- Repository内の関連するContext、Risk、Control、Evidence

入力には `templates/planning-input.md` を使用できる。

## Method

1. 入力を `Fact`、`Unknown`、`Assumption`、`Hypothesis`、`Decision`、`Evidence` に分類する。
2. 企業目標と組織目標の関係を整理する。
3. Securityへの影響が説明できる目標だけを対象にする。
4. 関連するBusiness / Asset / Threat / Attack Path / Risk / Existing Controlを確認する。
5. 結論を左右する不足情報だけを質問する。1回の質問は3〜5件以内とする。
6. 1〜5件のSecurity Objective案を作る。
7. 各Objectiveに、少なくとも1つのKPIを定義する。
8. Initiative、Evidence計画、Residual Riskを対応付ける。
9. 人による修正とDecision Authorityの承認を求める。AI出力を承認済みとして扱わない。

## Objective Requirements

各Objectiveに次を含める。

- Objective ID / Title
- Linked Company Goal
- Linked Organization Goal
- Expected Business / Risk Outcome
- Current State / Baseline
- Target State
- Risks and Attack Paths Addressed
- Existing Controls
- Proposed Initiatives
- KPI
- Evidence
- Assumptions / Unknowns
- Residual Risk
- Owner
- Decision Authority
- Review Cadence

Baselineが不明な場合は数値を発明せず、`Unknown`、確認方法、確認期限を記載する。

## KPI Requirements

- 各Objectiveに少なくとも1つのKPIを出力する。
- KPIは `templates/kpi.md` の構造に従う。
- 定性的な成果も、観測可能な状態、再現可能な判定条件、期限、Evidenceを持つKPIにする。
- Measurement Modeは `count`、`duration`、`date`、`amount`、`absolute-quantity`、`state` のいずれかとする。
- 割合、パーセント、率、比率、分数表現を使用しない。
- 母集団が必要な場合、対象総数と条件を満たす件数を別々の絶対値として記載し、除算しない。
- 活動件数だけで成果を表現しない。

## Output

1. Current understanding
2. Business-to-organization alignment
3. Missing critical context
4. Proposed Security Objectives
5. KPI definitions
6. Initiative candidates
7. Evidence and measurement plan
8. Assumptions / Unknowns
9. Residual risks
10. Decisions required
11. Suggested repository updates
