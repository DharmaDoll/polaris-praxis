# Prompt: Business Goals to Security Objectives and KPI

企業と組織の方向性を入力として、具体的なSecurity ObjectiveとKPIを設計する。期初の目標設定にはこのプロンプト、評価時期の振り返りには`12-results-to-next-year.md`を使う。

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

### チーム・機能別の目標を設定する場合

会社 → 部門 → 対象チーム・機能の順に、方針と役割を接続する。部門全体の目標をそのまま各チームに割り当てず、担当する製品・工程・権限・他チームへの依存を確認する。

- チームが直接担う成果と、開発・運用・製品責任者等との共同成果を分け、KPIがどちらを測るか明記する。
- レビュー、脆弱性対応、標準化、教育等の活動から「何を改善・維持する機能か」を考える。活動一覧をそのまま目標一覧にしない。
- 基盤づくりや判断能力の定着は、観測可能な状態のKPIで評価できる。売上や事故件数へ無理に直結させない。
- 定常業務を安定して担う成果と、今期の改善重点を区別する。改善目標だけでチームの役割全体を代表させない。
- 外部の活動体系は範囲を考える参考とする。実際の組織分担・担当者・達成基準を外部資料から推定しない。割合のKPI例はこのPJへ持ち込まない。

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

## 簡易計画

利用者がQuick Startまたは「簡易計画」を指定した場合は、上記の分析要件を保ち、次の形式で提示する。

### 入力の受け付け方

- 既存の事業計画、組織目標、会話のメモから受け付ける。最初からテンプレートへの転記や台帳整備を要求しない。
- `AGENTS.md`、`vision/`、`context/manifest.yaml`と関連Contextを読み、会社・組織のVision、Values、目標、重点施策、制約を確認する。既存情報の再入力を求めない。
- 最初に理解した対象・期間、重要な不足情報、仮定、出力先を短く示す。出典未確認の申告を確認済みFactにしない。
- **組織目標と個別施策を区別する。** Objectiveは事業やリスクの望ましい変化として表現する。ツール導入、設定変更、棚卸し等は、その成果を支えるInitiativeへ位置付ける。
- 目標案は通常1〜3件に絞る。案に含めない重要な領域がある場合は、その理由も示す。
- 情報不足でも、根拠のある範囲の案と未確定箇所を提示する。結論に必要な質問は優先順に最大3つ。根拠のない数値、担当者、期限、承認状態を埋めない。

### 最初に読む部分：会議用の目標案

1ページ程度を目安に、次の3点を示す。

1. **目指す成果**：会社・組織目標とのつながり、なぜ今取り組むか。
2. **目標と取り組み**：Objective、KPIの現状と目標、Initiative、担当・期限の案。各ObjectiveとInitiativeに少なくとも1つのKPIを紐付ける。
3. **決めること**：優先順位、必要な時間・人員、承認または確認が必要な事項。

値が未確定ならUnknownと確認方法を示す。新たな目標値・担当・期限は「提案」と明記する。重要な残余リスクと判断を左右するUnknownは本文から省かない。

### 必要なときに読む部分：根拠と判断の補足

詳細は末尾の`<details>`にまとめる。目標からBusiness / Asset / Threat / Attack Path / Risk、既存ControlとGap、施策、KPI、Evidenceまで辿れるようにする。資産の3つの価値、Detect / Respond / Recover、残余リスク、反証・再検討条件も関連する範囲で示す。情報状態とEvidence Status / Confidenceを保持する。

出力は未承認ドラフトとする。保存する場合は対象が分かる`drafts/`配下へ置き、入力・作成日・作成者・レビュー状態を残す。Unknownは登録案として整理し、利用者のレビュー前に正本や台帳へ反映しない。Syntheticサンプルの出力はそのサンプルの`generated/`だけに保存する。
