# Security Strategy OS

半期・年度末に、部内のチーム・機能ごとの目標と実績から「何を評価し、次期に何を続ける・変えるか」を整理するための作業基盤です。会社・部門の方針と、そのチームが担う成果をつなぎ、会議で使える評価案を作ります。

## 利用者向けクイックスタート

まずは [短い入力メモ](examples/quick-review/input.md) と [返ってくる評価案](examples/quick-review/generated/review.md) を見比べてください。Product Security部内のAppSecチームの2つの目標を振り返る架空のサンプルです。[PSIRT・基盤・運用などの目標例](examples/quick-review/team-goal-examples.md)と、[根拠資料がまだない場合](examples/quick-review/generated/review-minimal.md)の出力例もあります。

### 1. 目標と実績を渡す

このリポジトリを参照できるAIエージェントに、次の依頼文をコピーし、分かるところだけ埋めて渡します。既存の目標シート、週報、議事録をそのまま使えます。資料の所在だけ分かる場合は、その旨を記載してください。

```text
prompts/12-results-to-next-year.md の「簡易レビュー」で振り返ってください。
既存の会社・部門の方針と、対象チームの役割・目標があれば参照してください。
チーム自身の成果と、他チームとの協働による成果・未解決事項を分けて評価してください。
会議で読める1ページ程度に、今回の評価・次期の方針案・決めることをまとめてください。
根拠と詳しい理由は末尾に分け、確認が必要な質問は最大3つに絞ってください。
出力は承認前の案とし、正本や台帳は更新しないでください。

対象チーム・機能、担当する製品・範囲、評価期間：
1. 目標：会社・部門の方針、チームの役割、今期の目標と達成条件
2. 実績：できたこと、できなかったこと、分かる数値や状態
3. 根拠：確認できる記録・資料とその日付。手元になければ「未確認」
4. 次期の事情：重点の変更、使える人員・時間、期限、他チームへの依存
```

正式なKPIがなくても、整理から始められます。評価基準が未設定ならその旨を残し、後付けの基準で達成扱いにはしません。入力の書式整理と不明点の抽出はエージェントが担当します。

実データは、組織が承認した保存先とAI利用環境で扱ってください。共有できない原本は渡さず、必要最小限の要約と参照先を使います。

### 2. 評価案を読む

最初に読むのは次の3点です。

- **今回の評価**：チームは役割をどこまで果たしたか。共同成果はどうなったか。何が根拠不足で判断できないか
- **次期の方針案**：何を続ける・変える・止めるか。次の目標と測り方、担当・期限の案
- **決めること**：責任者に判断してほしいこと、結論に必要な確認事項

重要な残余リスクと判断保留の理由は本文に残します。詳しい攻撃経路や根拠の対応は、末尾の補足で確認できます。未確認の資料を確認済みとして扱いません。

### 3. 修正し、次の行動を決める

事実の違い、方針案への賛否、担当・期限を確認してください。「この実績は訂正」「この提案を検討したい」「この資料を追加する」と短く返せば、評価案を修正できます。

評価案の作成までを、このQuick Startの区切りとします。正式な承認や残余リスクの受容は責任者が行い、その後に担当者・エージェントが承認された範囲を台帳と計画へ反映します。詳しくは [運用モデル](governance/OPERATING_MODEL.md) を参照してください。

<details>
<summary>これから期初の目標を決める場合</summary>

次の依頼文と、既存の事業計画・部門目標を渡してください。会社・部門の方向性とチームの役割を確認してから、目標を1〜3件に絞ります。

```text
prompts/11-goal-to-kpi.md の「簡易計画」で、今期のチーム目標を提案してください。
会社・部門のVision、Values、目標と、チームの役割・重点施策・制約は以下を使ってください。
チーム自身が担う成果と、開発など他チームとの共同成果を区別してください。
会議で読める1ページ程度に、目標・KPI・取り組み・決めることをまとめてください。
現状や根拠が足りない部分は未確認とし、確認質問は最大3つに絞ってください。
出力は承認前の案とし、正本や台帳は更新しないでください。

対象チーム・機能、担当範囲、期間：
会社・部門の方針と目標、チームの役割：
重点施策と制約：
分かっている現状・前期の実績と根拠：
```

項目を整理して入力したい場合は [Planning Input](templates/planning-input.md)、詳細な実績入力には [Period Results](templates/period-results.md) を使えます。

</details>

## 大切にする考え方

> Documents are views. Evidence, structured registers, and decisions are the source.

事実・未知・仮説・判断・根拠を区別し、組織として説明可能な戦略を継続的に構築します。目標には事業やリスクの望ましい変化を置き、個別の作業・対策はそれを支える施策として扱います。短い評価案でも、事業とのつながり、既存対策、残余リスク、根拠を保ちます。活動の完了だけを、リスク低減の証明にはしません。

KPIは件数・日数・日時・金額・絶対量・観測可能な状態で表し、割合・率・比率は使いません。AIの出力自体はEvidenceではありません。

<details>
<summary>判断を支える全体モデル</summary>

```text
Company Vision / Values / Annual Goals
→ Organization Mission / Goals / Priority Initiatives
→ Business / Mission → Asset / Crown Jewel → Threat → Attack Path → Risk
→ Existing Control / Control Gap → Proposed Control → Residual Risk → Resilience
→ Strategy / Objective / Roadmap / Initiative → Execution → KPI / Evidence
→ Actuals / Review / Next-period Recommendations → Strategy
```

詳細は [Vision](vision/VISION.md)、[Principles](vision/PRINCIPLES.md)、[Security Model](vision/SECURITY_MODEL.md) を参照してください。

</details>

<details>
<summary>継続運用・エージェント設定を担当する方へ</summary>

## エージェントを使った運用

このリポジトリは単体アプリケーションではなく、Codexなどのエージェントに読み込ませて、利用者の組織データを継続的に更新するための作業基盤です。エージェントは「正解を決める自動化」ではなく、入力の整理、追跡可能なドラフト作成、質問の抽出、検証を担当します。承認とRisk Acceptanceは人が行います。

### エージェントに渡すもの

エージェントを起動する前に、[`context/README.md`](context/README.md) の入力契約を確認し、次の順でコンテキストを指定します。

1. このリポジトリの`AGENTS.md`
2. `vision/`と対象業務に関係する`context/`
3. 対象の入力ファイル（通常は`context/business/`のPlanning Input）
4. 実行するPrompt（`prompts/11-goal-to-kpi.md`または`prompts/12-results-to-next-year.md`）
5. [`templates/agent-request.md`](templates/agent-request.md) で出力先、対象ブランチ、今回のレビュー範囲を指定する

依頼文には、対象組織・対象サービス・期間・既知のEvidence・不明点を明記してください。未提供の組織情報をエージェントに推測させてはいけません。

### エージェントの安全な作業単位

```text
Read → Classify (Fact / Unknown / Assumption / Decision / Evidence)
     → Ask minimum questions
     → Draft Objective / KPI / Risk traceability
     → Run validator
     → Human review gate
     → Approved files only merge to main
```

エージェントの出力は、承認前は [`drafts/`](drafts/) に保存するドラフトです。特に`registers/`、`strategy/`、`roadmap/`、`initiatives/`の正本更新、Residual Riskの受入れ、Decision Recordの確定は、レビュー完了後に行います。Promptごとの入力・出力・Gateは [`prompts/README.md`](prompts/README.md) に記載しています。実データを扱う保存先は組織が承認したアクセス制御下に置き、その中で作業ブランチを使用してください。簡易レビューは会話のメモから受け付け、保存が必要な入力整理案と出力は`drafts/`に置きます。

### Skillの段階的な導入案

最初は一つの複合Skillにまとめ、同じ作業が繰り返されてから分割します。Skillは判断を自動承認するものではなく、`AGENTS.md`、テンプレート、Prompt、検証スクリプトを正しい順序で使わせる手順書です。

- `security-strategy-operator`（初期候補）: Intake、Objective/KPI設計、Evidenceレビュー、次期提言、検証をモードとして提供
- `security-strategy-intake`（分割候補）: Planning Inputの不足項目、Fact/Unknown分類、入力受入れGate
- `security-strategy-objective`（分割候補）: Goal → Risk → Objective → KPI → Initiativeの追跡性と割合表現禁止の検査
- `security-strategy-review`（分割候補）: Actual / Evidence、Residual Risk、Continue/Change/Stop等の判断材料整理
- `security-strategy-quality-gate`（分割候補）: YAML・ID・参照・Markdownリンク・不確実性の検証

Skill導入の判断条件は、同じ手作業が複数のPilotで繰り返され、入力漏れやレビュー漏れがEvidenceとして確認されたことです。最初からUIや多数のSkillを作らず、既存Promptと`ruby scripts/validate_repository.rb`を呼び出す薄いSkillから始めます。

## Start Here（設計・運用者向け）

1. `AGENTS.md`、[`vision/VISION.md`](vision/VISION.md)、[`vision/PRINCIPLES.md`](vision/PRINCIPLES.md) を確認する
2. [詳細仕様](docs/USER_GUIDE_AND_SPECIFICATION.md)と[Pilot手順](docs/PILOT_GUIDE.md)を読む
3. 上記クイックスタートで一つの対象を最後まで通す
4. [実装計画](plan.md)と[MVP後の拡張候補](docs/DEFERRED_REQUIREMENTS.md)を確認する

ファイル変更後は`ruby scripts/validate_repository.rb`で基本的な台帳・リンクの整合性を確認します。評価内容や承認の妥当性は人が確認します。

## Sample Data

[簡易レビュー](examples/quick-review/)には短いメモから評価案を作る例、[Product Security](examples/product-security-controls/)には詳細な目標・現状・実績の入力例があります。`examples/`配下はすべてSyntheticかつ非正本であり、rootの台帳・戦略・Evidenceへ自動反映しません。

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

</details>
