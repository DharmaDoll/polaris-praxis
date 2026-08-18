# Security Strategy OS 利用手順・仕様書

## 1. 文書情報

| 項目 | 内容 |
|---|---|
| 対象 | Security Strategy OS リポジトリ |
| 文書の目的 | 現行版を利用するための手順と、実装済み機能の仕様を一つにまとめる |
| 基準日 | 2026-08-18 |
| 対象フェーズ | 現行実装（Roadmap の Phase 0 相当） |
| 正本 | `main` ブランチ上の本ファイル |

本仕様の根拠は、リポジトリ内の `README.md`、`AGENTS.md`、`vision/`、`roadmap/`、テンプレート、台帳、プロンプト、およびディレクトリ構成である。現時点で確認できる事実は、WebアプリケーションやCIはなく、ローカル検証スクリプトだけが存在し、組織固有のContextとEvidenceは未投入であること。現行実装を「MVP / Phase 0 相当」とするのは、`roadmap/ROADMAP.md`の完了条件との照合に基づく評価であり、組織による承認済み判断ではない。

## 2. このアプリケーションについて

Security Strategy OS は、組織のサイバーセキュリティ戦略を Git 上で継続的に設計・運用するための、リポジトリ型アプリケーションである。

実行ファイル、Web UI、データベースを持つ一般的な業務アプリケーションではない。Markdown と YAML をデータとして扱い、Git のブランチ、コミット、レビュー履歴を変更管理と監査証跡に利用する。Codex 等のリポジトリを参照できる AI エージェントは作業支援に利用できるが、最終判断と承認は人が行う。

中核となる情報の流れは次のとおりである。

```text
Company Vision / Values / Annual Goals
→ Organization Mission / Annual / Period Goals / Priority Initiatives
→ Business / Mission
→ Asset
→ Threat
→ Attack Path
→ Risk
→ Existing Control
→ Control Gap
→ Proposed Control
→ Residual Risk
→ Resilience
→ Objective
→ Initiative
→ KPI / Supporting Metric
→ Evidence
→ Actual / Review
→ Next-period Recommendation / Learning
```

利用者の主要な入口は企業・組織目標である。Threat、Attack Path、Risk、Control等は、ObjectiveとKPIの妥当性を裏側で検証するために段階的に使用する。

## 3. 現行版の対象範囲

### 3.1 できること

- 事業、組織、資産、アーキテクチャなどの前提情報を格納する
- `Fact`、`Unknown`、`Assumption`、`Hypothesis`、`Decision`、`Evidence` を区別して扱う
- Objective、リスク、意思決定、施策、未解決事項を YAML 台帳で管理する
- 企業・組織目標を入力し、Security ObjectiveとKPI案を作成する
- 後日実績を入力し、次期・次年度への提言案を作成する
- リスク、戦略、Objective、KPI、施策、実績レビューを共通テンプレートで記述する
- 13 種類のプロンプトを使い、目標入力、現状評価、戦略設計、実績レビューを支援する
- Git ブランチと Pull Request を使い、仮説・選択肢と承認済み状態を分離する
- 戦略から施策、指標、証跡までの追跡可能性を人手で維持する
- YAML台帳、ID、Decision参照、Markdownリンクをローカルで検証する

### 3.2 現行版では行わないこと

- YAML や Markdown の自動入力、正式Schema検証、CIでの強制
- リスクスコアや優先順位の自動計算
- 外部システムからのメトリクス／証跡の自動取得
- ユーザー認証、認可、承認ワークフローの提供
- Web 画面、API、通知、定期実行
- AI の出力を無人で `main` に反映すること

これらは不具合ではなく、現行 MVP の境界である。重要な拡張候補は [DEFERRED_REQUIREMENTS.md](DEFERRED_REQUIREMENTS.md) で管理する。

## 4. 前提条件

### 4.1 必須

- Git を利用できること
- リポジトリへの読み取り／書き込み権限があること
- Markdown と YAML を編集できること
- `main` を承認済みの現在状態として扱うこと
- ローカル検証を行う場合はRubyを利用できること

### 4.2 推奨

- Pull Request によるレビューができる Git ホスティング環境
- リポジトリ全体を参照できる AI エージェント
- 事業、システム、セキュリティ、リスク受容の各責任者によるレビュー

### 4.3 未確定事項

承認権限、情報分類、証跡の保存要件などの組織固有ルールは未定義である。該当項目は `registers/unknowns.yaml` に記録し、解決するまで事実として扱わない。

## 5. 最短の利用手順

### Step 1: 基本方針を確認する

最初に次を読む。

1. `AGENTS.md`
2. `vision/VISION.md`
3. `vision/PRINCIPLES.md`
4. `vision/SECURITY_MODEL.md`
5. `docs/INPUT_MODEL.md`

### Step 2: 作業ブランチを作る

新規導入時は `agent/*`、戦略策定は `strategy/*`、計画策定は `planning/*` を使用する。

```bash
git switch -c agent/bootstrap-current-state
```

ブランチの用途は [BRANCHING.md](BRANCHING.md) に従う。

### Step 3: 企業・組織目標を入力する

`templates/planning-input.md`を複製し、企業のVision、Values、年間目標、組織のMission、年間／期目標、重点施策、制約を記載する。前期実績がある場合はEvidenceとともに入力する。

入力の出典とInput Ownerを記載し、FactとAssumptionを区別する。情報分類ルールが未確定の場合は、`guidelines/INFORMATION_HANDLING.md`に従い、機密原本を置かず安全に管理された参照先と必要最小限の要約だけを記録する。

### Step 4: Security ObjectiveとKPI案を作る

AIエージェントへ`prompts/11-goal-to-kpi.md`の実行を依頼する。企業・組織目標との接続を保ちながら、1〜5件のSecurity Objective案と、各Objectiveに少なくとも1つのKPIを出力する。

KPIは絶対件数、所要時間、期限、金額、絶対量、または観測可能な状態で表現する。割合、パーセント、率、比率は使用しない。Baselineが不明な場合は値を発明せず、Unknownと確認方法を記録する。

### Step 5: 不足情報を整理する

より詳細なCurrent Stateが必要な場合は、`prompts/00-bootstrap-interview.md`を使う。一度に質問するのは、結論を左右する3〜5件に限定する。

- 未解決の質問は `registers/unknowns.yaml`
- 検証前の前提は `registers/assumptions.yaml`
- Objectiveの索引は `registers/objectives.yaml`
- 承認済みの判断は `registers/decisions.yaml` と `decisions/` 配下の判断記録

情報が不足している場合は、文章を補完して完成させず、`Unknown` または `Assumption` として残す。

### Step 6: リスク根拠を確認する

`prompts/01-current-state-assessment.md` を使い、次の連鎖で現状を評価する。

```text
Business → Asset → Threat → Attack Path → Risk
→ Existing Control → Residual Risk → Resilience
```

リスクごとに `templates/risk.md` を複製し、`analysis/risks/` に詳細を保存する。台帳の索引情報は `registers/risks.yaml` に追加する。

Objective案に関係するリスク、Attack Path、既存Control、Residual Riskを優先して評価する。網羅的な棚卸しを先に完成させる必要はない。

### Step 7: Objectiveを承認し、実行計画を作る

十分な根拠が揃った後、次の順に進める。

1. `templates/objective.md`でObjective詳細を作り、`registers/objectives.yaml`へ索引を追加する
2. `templates/kpi.md`でKPIを`metrics/`に作成し、`registers/kpis.yaml`へ索引を追加する
3. `prompts/02-strategy-design.md`と`templates/strategy.md`で`strategy/`に戦略を作成する
4. `prompts/03-roadmap-planning.md`で`roadmap/<YEAR>/`にロードマップを作成する
5. `templates/initiative.md`で`initiatives/`に施策定義を作成する
6. `registers/initiatives.yaml`に施策の索引を追加する

各Objectiveと施策は少なくとも1つのKPIを持ち、対象リスク、対象 Attack Path、リスク低減仮説、残余リスク、証跡を必ず明示する。

### Step 8: Decision Gateを通して`main`へ反映する

Pull Request では少なくとも次を確認する。

- 事業・ミッションへの影響が説明されている
- 重要な不明点と仮定が明示されている
- リスクが脅威と Attack Path に結び付いている
- 既存コントロールを評価している
- 新しいコントロールが対象リスクと Attack Path に結び付いている
- 残余リスクが明示されている
- 成果指標と証跡の場所が定義されている
- Owner と Decision Authority が明示されている

`governance/OPERATING_MODEL.md`のGate 1とGate 2を使う。組織が定めるDecision Authorityのレビュー後に`main`へマージする。具体的な担当者は現時点では未確定である。

### Step 9: 実績を入力し、次年度提言を作る

1. KPI ActualとEvidenceを定期的に更新する
2. `templates/period-results.md`へ計画、実績、差異、原因、事業・リスク影響を入力する
3. `prompts/12-results-to-next-year.md`でContinue / Change / Stop / Complete / Holdと次年度提言を作る
4. `governance/OPERATING_MODEL.md`のGate 3とGate 4でレビューする
5. 重大な環境変化は`scenario/*`と`prompts/06-scenario-analysis.md`で別途評価する

レビューでは施策の実施数ではなく、事業成果またはリスク成果の変化を優先して評価する。

### Step 10: ローカル検証を行う

```bash
ruby scripts/validate_repository.rb
```

YAML構文、台帳のトップレベル構造、必須フィールド、ID形式と重複、Objective／InitiativeからKPI台帳への参照、KPI測定方式、KPIで禁止された割合表現、Decision Record参照、Markdown相対リンクを確認する。

## 6. ディレクトリ仕様

| パス | 責務 | 主な形式 |
|---|---|---|
| `vision/` | 長期ビジョン、原則、思考モデル | Markdown |
| `context/` | 組織固有の現状と制約 | 任意のレビュー可能な形式 |
| `inputs/` | 内外の要求、フレームワーク、脅威情報 | 任意のレビュー可能な形式 |
| `analysis/` | Crown Jewel、Attack Path、リスク、ギャップ、レジリエンス分析 | 主に Markdown |
| `registers/` | 横断索引用の構造化台帳 | YAML |
| `controls/` | 既存／候補コントロールの有効性と対応関係 | 主に Markdown / YAML |
| `strategy/` | 承認対象となる戦略 | Markdown |
| `roadmap/` | 年度・半期の実行順序 | Markdown |
| `initiatives/` | 個別施策の定義と状態 | Markdown |
| `metrics/` | 指標定義と履歴 | Markdown / YAML / データファイル |
| `evidence/` | 評価、監査、インシデント、測定結果 | 任意のレビュー可能な形式 |
| `decisions/` | 意思決定記録 | Markdown |
| `governance/` | Role、Decision Gate、運用頻度 | Markdown |
| `guidelines/` | 暫定的な実装・取扱い指針 | Markdown |
| `reviews/` | 月次、四半期、半期、年次レビュー | Markdown |
| `policies/`, `standards/`, `guidelines/` | 戦略から導出された統制文書 | Markdown |
| `presentations/` | 対象読者別の説明資料 | Markdown 等 |
| `prompts/` | AI 支援ワークフローの指示 | Markdown |
| `templates/` | 主要成果物のひな型 | Markdown |
| `scripts/` | 依存の少ないローカル検証 | Ruby |
| `examples/` | Syntheticな入力・実績・生成結果。正本には使用しない | Markdown等 |

空ディレクトリは `.gitkeep` により保持される。

`examples/`配下の値、ID、Evidence、Decisionは組織のFactではない。実組織へ流用する場合は、新しい作業ブランチで全項目を実Evidenceへ置き換え、通常のDecision Gateを通す。

## 7. 機能仕様

### 7.1 情報状態の管理

重要な情報は、次のいずれかとして明示する。

| 状態 | 定義 | 代表的な保存先 |
|---|---|---|
| Fact | 確認済みの組織事実 | `context/` |
| Unknown | 判断に必要だが未確認の情報 | `registers/unknowns.yaml` |
| Assumption | 暫定的に採用する前提 | `registers/assumptions.yaml` |
| Hypothesis | 検証可能な因果・改善の予測 | 分析文書、施策定義 |
| Decision | 権限者が選択した方針 | `registers/decisions.yaml`, `decisions/` |
| Evidence | 主張や判断を裏付ける記録 | `evidence/` または安全な外部参照 |

現行版には状態を強制するスキーマがない。レビュー時に、事実と仮定が混在していないことを確認する。

### 7.2 台帳仕様

台帳は YAML のトップレベル配列で管理する。`scripts/validate_repository.rb`が基本的な必須項目とIDを検証するが、正式なSchemaや列挙値の完全な検証は行わない。

#### Unknown 台帳

ファイル: `registers/unknowns.yaml`

| フィールド | 意味 |
|---|---|
| `id` | 一意な識別子。例: `UNKNOWN-001` |
| `topic` | 分類 |
| `question` | 未解決の質問 |
| `status` | 状態。現行例は `open` |
| `priority` | 意思決定への影響度 |
| `owner` | 回答・解決の担当 |
| `needed_for` | 回答を必要とする成果物や判断 |
| `created_at` | 登録日（`YYYY-MM-DD`） |

#### Assumption 台帳

ファイル: `registers/assumptions.yaml`

| フィールド | 意味 |
|---|---|
| `id` | 一意な識別子。例: `ASM-001` |
| `statement` | 暫定的な前提 |
| `confidence` | 確信度 |
| `evidence` | 現時点の根拠 |
| `validation_method` | 検証方法 |
| `status` | 仮定の状態 |

#### Risk 台帳

ファイル: `registers/risks.yaml`

| フィールド | 意味 |
|---|---|
| `id` | 一意な識別子。例: `RISK-001` |
| `title` | リスク名 |
| `business_service` | 影響を受ける事業サービス |
| `crown_jewel` | 対象となる重要資産 |
| `threat` | 脅威またはシナリオ |
| `attack_paths` | 関連する Attack Path |
| `inherent_risk` | コントロール考慮前のリスク |
| `residual_risk` | コントロール考慮後の残余リスク |
| `owner` | リスク Owner |
| `treatment` | `avoid`, `mitigate`, `transfer`, `accept` |
| `evidence` | 根拠への参照 |

#### Objective 台帳

ファイル: `registers/objectives.yaml`

| フィールド | 意味 |
|---|---|
| `id` | 一意な識別子。例: `OBJ-001` |
| `title` | Objective名 |
| `period` | 対象年度と期間 |
| `company_goals` | 対応する企業目標 |
| `organization_goals` | 対応する組織目標 |
| `outcome` | 期待するBusiness / Risk Outcome |
| `risks` | 対象Risk ID |
| `attack_paths` | 対象Attack Path |
| `initiatives` | 実行施策への参照 |
| `kpis` | 1件以上のKPIへの参照 |
| `owner` | Objective Owner |
| `decision_authority` | 承認権限者 |
| `status` | Objectiveの状態 |
| `evidence` | 根拠への参照 |

#### KPI 台帳

ファイル: `registers/kpis.yaml`

| フィールド | 意味 |
|---|---|
| `id` | 一意な識別子。例: `KPI-001` |
| `title` | KPI名 |
| `objectives` | 対象Objective ID |
| `initiatives` | 対象Initiative ID |
| `outcome_type` | Business / Risk / Security Capability / Activityの区分 |
| `measurement_mode` | `count`, `duration`, `date`, `amount`, `absolute-quantity`, `state` |
| `unit` | 測定単位 |
| `baseline` | 基準値または状態 |
| `target` | 目標値または状態 |
| `period` | 測定対象期間 |
| `owner` | KPI Owner |
| `evidence` | Evidenceへの参照 |
| `status` | KPIの状態 |

#### Initiative 台帳

ファイル: `registers/initiatives.yaml`

| フィールド | 意味 |
|---|---|
| `id` | 一意な識別子。例: `INIT-001` |
| `title` | 施策名 |
| `strategic_objective` | 対応する戦略目標 |
| `period` | 対象年度と半期 |
| `status` | 施策の状態 |
| `risks` | 対象リスク ID |
| `kpis` | 1件以上のKPIへの参照 |
| `owner` | 施策 Owner |

#### Decision 台帳

ファイル: `registers/decisions.yaml`

| フィールド | 意味 |
|---|---|
| `id` | 一意な識別子。例: `DEC-001` |
| `title` | 判断の題名 |
| `status` | 判断の状態 |
| `decision_record` | `decisions/` 配下の詳細記録 |
| `date` | 判断日（`YYYY-MM-DD`） |

### 7.3 テンプレート仕様

| テンプレート | 用途 | 主な必須観点 |
|---|---|---|
| `templates/planning-input.md` | 企業・組織目標の入力 | Vision、Values、年間／期目標、重点施策、制約、出典、Input Owner |
| `templates/objective.md` | Objective定義 | 企業・組織目標、成果、Risk、Attack Path、KPI、Residual Risk、Owner、承認 |
| `templates/risk.md` | 個別リスク分析 | 事業、資産、脅威、Attack Path、既存コントロール、残余リスク、証跡 |
| `templates/strategy.md` | 年度戦略 | 事業背景、重要リスク、戦略テーマ、優先順位、指標、残余リスク |
| `templates/initiative.md` | 施策定義 | 対象リスク、低減仮説、範囲、基準値、目標、証跡、Owner |
| `templates/kpi.md` | KPI定義 | 対象目標、測定方式、基準値、目標値、実績、判定条件、証跡、Owner |
| `templates/decision.md` | 意思決定記録 | 選択肢、判断、根拠、低減リスク、残余リスク、再検討条件、権限者 |
| `templates/half-year-review.md` | 半期レビュー | 計画対実績、リスク変化、学習、継続／変更／中止判断 |
| `templates/period-results.md` | 期中・期末実績入力 | KPI実績、Evidence、差異、原因、事業・リスク影響、次期提言 |

テンプレートの見出しは、該当しない場合も黙って削除せず、`該当なし` または `Unknown` と理由を記載する。

### 7.4 プロンプト仕様

| ID | ファイル | 入力 | 主な出力 |
|---|---|---|---|
| 00 | `00-bootstrap-interview.md` | Vision、Context、Registers | 現状理解、不足情報、質問 |
| 01 | `01-current-state-assessment.md` | 事業・資産・脅威・統制の証跡 | 現状評価、Top Risk、残余リスク |
| 02 | `02-strategy-design.md` | Current State、事業戦略 | 戦略テーマ、年度目標、優先順位 |
| 03 | `03-roadmap-planning.md` | 承認済み戦略 | FY/H1/H2 ロードマップ、Decision Gate |
| 04 | `04-metrics-design.md` | 目標、リスク、データソース | KPI/KRI、測定方法、基準値、目標 |
| 05 | `05-half-year-review.md` | 計画、実績、指標、証跡 | 差異分析、学習、継続／変更／中止 |
| 06 | `06-scenario-analysis.md` | `main` と変更仮定 | 戦略・施策・指標の差分 |
| 07 | `07-control-option-analysis.md` | リスク、Attack Path、選択肢 | 比較表、推奨、残余リスク |
| 08 | `08-executive-presentation.md` | 承認済み戦略、指標、証跡 | 経営向け説明構成、必要な判断 |
| 09 | `09-policy-standard-guideline.md` | 戦略、リスク、統制目標 | Policy / Standard / Guideline |
| 10 | `10-red-team-critic.md` | レビュー対象の戦略 | 弱点、不足根拠、承認前の修正 |
| 11 | `11-goal-to-kpi.md` | 企業・組織目標、重点施策、制約 | Security Objective、KPI、Evidence計画、必要な判断 |
| 12 | `12-results-to-next-year.md` | 承認済みObjective、KPI実績、Evidence | 差異分析、継続／変更／中止、次年度提言 |

AI 出力はドラフトであり、Evidence ではない。組織固有の事実、引用、数値、Owner、判断状態を人が検証する。

### 7.5 ブランチ仕様

| パターン | 用途 |
|---|---|
| `main` | 承認済みの現在状態 |
| `strategy/*` | 次年度・中長期戦略 |
| `planning/*` | 半期・四半期計画 |
| `initiative/*` | 大規模施策 |
| `scenario/*` | What-if / 脅威シナリオ |
| `option/*` | コントロール／アーキテクチャ比較 |
| `experiment/*` | 指標、フレームワーク、ワークフローの検証 |
| `agent/*` | AI エージェントによる大規模ドラフト |

未来、仮説、比較中の選択肢は `main` に直接置かない。計画系ブランチは確定後にマージし、長期維持しない。

## 8. トレーサビリティ仕様

主要な判断は、次の参照関係を再現できなければならない。

```text
Company Vision / Values / Annual Goal
→ Organization Mission / Annual / Period Goal
→ Security Objective ID
→ Business Service
→ Crown Jewel
→ Threat / Attack Path
→ Risk ID
→ Control / Initiative ID
→ KPI
→ Evidence
→ Decision ID
```

現行MVPは基本的なIDとファイル参照をローカル検証するが、意味上の整合性は自動判断しない。文書中にIDまたは相対パスを記載し、Pull Requestで目標との不整合、孤立した施策、根拠のない判断がないことを確認する。

## 9. 優先順位付け仕様

脆弱性の技術的深刻度だけで優先順位を決めてはならない。少なくとも次を評価する。

- 影響を受ける Business / Mission
- 資産の Intrinsic Value
- 資産の Path / Positional Value
- 資産の Operational Value
- 現実的な脅威と Attack Path
- 既存コントロールの有効性
- 発生可能性と事業影響
- 残余リスクとレジリエンス
- コスト、依存関係、実行能力、Time to Value

精密な数値モデルは現時点で定義されていない。根拠が不足する場合は疑似的な精度を作らず、定性的評価と不足証跡を明示する。

## 10. KPI・指標仕様

指標は次の順に優先する。

1. Business Outcome
2. Risk Outcome
3. Security Capability
4. Activity

すべてのStrategic ObjectiveとInitiativeに、少なくとも1つのKPIを定義する。定性的な成果が適切な場合もKPIを省略せず、観測可能な状態、第三者が再現できる判定条件、期限、必要なEvidenceを定義する。

KPIには、名称、対象目標、対象リスク、定義、Measurement Mode、単位、データソース、基準値、目標値、実績値、頻度、Owner、注意点、Gaming Risk、証跡場所を定義する。Measurement Modeは次から選ぶ。

- `count`: 絶対件数
- `duration`: 時間、日数などの所要時間
- `date`: 完了日または期限
- `amount`: 金額
- `absolute-quantity`: データ量、システム数などの絶対量
- `state`: 明示的な判定条件を持つ観測可能な状態

KPIでは割合、パーセント、率、比率、分数表現を使用しない。Coverage rate、achievement rate、compliance rate等も使用しない。母集団の把握が必要な場合は、対象総数と条件を満たす件数を別々の絶対値として記録し、除算しない。

活動件数だけをリスク低減の証明に使わず、可能な限りBusiness OutcomeまたはRisk Outcomeを測定する。定性的な状態を数値化するためだけに、根拠のないスコアを作らない。

## 11. 異常時・不足情報の扱い

| 状況 | 処理 |
|---|---|
| 判断に必要な情報がない | `Unknown` を登録し、確定を保留する |
| 暫定前提で進める必要がある | `Assumption`、確信度、検証方法を登録する |
| 証跡がない主張がある | `Evidence Status: Missing`、`Confidence: Low` と明示する |
| YAML の構文が壊れている | マージせず、構文を修正する |
| 同じ ID が重複している | 新規 ID を割り当て、参照を修正する |
| 施策がリスクに紐付かない | スコープ外とするか、対象リスクを根拠付きで定義する |
| コントロール後もリスクが残る | 残余リスク、Owner、処置、受容権限を明示する |
| AI 出力と内部証跡が矛盾する | 内部証跡を優先し、矛盾をレビュー記録に残す |

## 12. 非機能仕様

### 12.1 監査性

変更者、変更日時、差分、レビュー結果を Git 履歴で追跡可能にする。重要判断はコミットメッセージだけに残さず、Decision Record を作成する。

### 12.2 可搬性

主要データは Markdown / YAML とし、特定ベンダーの専用形式に依存しない。

### 12.3 セキュリティ

リポジトリ自体のアクセス制御は Git ホスティング基盤に依存する。Secret、認証情報、不要な個人情報はコミットしない。組織ルールが未確定の間は`guidelines/INFORMATION_HANDLING.md`を適用するが、正式な情報分類・保持・削除ルールを代替しない。

### 12.4 可用性・復旧

リポジトリの可用性、バックアップ、復旧目標は Git ホスティング基盤と組織運用に依存し、現行リポジトリでは定義していない。

### 12.5 性能

サーバープロセスを持たないため、応答時間や同時接続数の要件は対象外である。大容量バイナリや機密原本を無制限に格納しない。

## 13. MVP 完了条件

Phase 0 の完了条件は次のとおりである。

- 基本ディレクトリ、台帳、テンプレート、プロンプトが利用できる
- 重要情報を Fact / Unknown / Assumption / Decision / Evidence として区別できる
- 企業・組織目標からSecurity ObjectiveとKPI案を作成できる
- KPI実績とEvidenceから次期・次年度提言案を作成できる
- 初回インタビューを実施し、重要な不足情報を台帳化できる
- Pull Request で判断根拠、不確実性、リスクとの関係をレビューできる
- ローカル検証で基本的な台帳・ID・リンク不整合を検出できる

組織固有のTop Riskを説明できることと、本ワークフローが意思決定に有益であることは実証されていない。`docs/PILOT_GUIDE.md`に従ったPilot完了までは、組織適合性の`Evidence Status: Missing`、`Confidence: Low`とする。

## 14. 関連文書

- `README.md`: 概要と開始地点
- `AGENTS.md`: AI エージェントを含む作業時の必須ルール
- `docs/INPUT_MODEL.md`: 必要な入力情報
- `docs/BRANCHING.md`: ブランチ運用
- `docs/PILOT_GUIDE.md`: 小規模実証の範囲、手順、評価方法
- `governance/OPERATING_MODEL.md`: Role、Decision Gate、運用頻度
- `guidelines/INFORMATION_HANDLING.md`: 正式ルール決定前の暫定情報取扱い
- `roadmap/ROADMAP.md`: リポジトリ自体の発展計画
- `docs/DEFERRED_REQUIREMENTS.md`: MVP 後に扱う重要項目
