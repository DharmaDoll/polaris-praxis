# Security Strategy OS Implementation Plan

## Purpose

現行MVPから、1つの重要事業サービスで「企業・組織目標の入力 → Security Objective / KPI → 実績 → 次年度提言」を実証するまでのチェックリスト。

```text
Evidence Status: 実運用Evidenceは未取得
Confidence: Low
Primary Goal: 機能追加ではなく、意思決定に利用できることの実証
```

## Working Rules

- `[x]`はリポジトリ上で実装・確認済み、`[ ]`は未完了
- 初回Pilotは1組織、1事業サービス、Objective 1〜3件、Material Risk 3〜5件、Initiative 1〜2件に限定する
- 組織情報がない項目は発明せず、Unknownとして登録する
- 全ObjectiveとInitiativeにKPIを設定する
- KPIに割合、パーセント、率、比率、分数表現を使わない
- UI、API、大規模自動化はPilot Evidenceが得られるまで着手しない

## Phase 0 — MVP Foundation

- [x] Vision、Principles、Security Modelを定義する
- [x] Fact / Unknown / Assumption / Decision / Evidenceの扱いを定義する
- [x] Planning Input、Objective、KPI、Initiative、実績のテンプレートを用意する
- [x] 企業・組織目標からObjective / KPIを作るプロンプトを用意する
- [x] 実績から次年度提言を作るプロンプトを用意する
- [x] Objective、KPI、Risk、Initiative、Decision、Unknownの台帳を用意する
- [x] Operating ModelとDecision Gateを定義する
- [x] 暫定Information Handling Guidelineを定義する
- [x] YAML、ID、KPI参照、禁止KPI表現、Markdownリンクのローカル検証を実装する
- [x] 正本と分離したSynthetic Sampleを用意する
- [x] `ruby scripts/validate_repository.rb`が成功することを確認する

Exit: 企業・組織目標と実績を入力するためのMVP部品が利用できる。

## Phase 1 — Pilot Setup

- [ ] Pilot対象組織を1つ選ぶ
- [ ] 対象となる重要事業サービスを1つ選ぶ
- [ ] Input Ownerを割り当てる
- [ ] Objective Owner候補を決める
- [ ] Risk Owner候補を決める
- [ ] Evidence Owner候補を決める
- [ ] Repository Maintainerを割り当てる
- [ ] Decision Authorityを決定し、`UNKNOWN-001`を更新する
- [ ] 継続更新のOwnerを決定し、`UNKNOWN-004`を更新する
- [ ] 実組織データ投入前に情報分類・アクセス条件を決定し、`UNKNOWN-002`を更新する
- [ ] Pilot用の`planning/*`ブランチを作成する

Gate: 対象、Owner、Decision Authority、情報取扱い条件が明示されている。

## Phase 2 — Planning Input

- [ ] `templates/planning-input.md`を対象年度・期間向けに複製する
- [ ] Company Vision / Values / Annual Goalsを入力する
- [ ] Organization Mission / Annual Goals / Period Goalsを入力する
- [ ] Priority InitiativesとConstraintsを入力する
- [ ] 前期実績とLessonsがあれば入力する
- [ ] 各入力にSource / Evidenceを付ける
- [ ] 各入力をFact / Unknown / Assumptionへ分類する
- [ ] 重大な不足情報を`registers/unknowns.yaml`へ登録する
- [ ] Information Handling Guidelineに反する原本がないことを確認する
- [ ] Gate 1: Input Acceptedを実施する

Exit: Objectiveを検討できる最小限のBusiness / Organization Contextが承認されている。

## Phase 3 — Objective / KPI Design

- [ ] `prompts/11-goal-to-kpi.md`を実行する
- [ ] 結論を左右する質問を3〜5件以内に絞る
- [ ] 関連するAssetをIntrinsic / Positional / Operational Valueで確認する
- [ ] 関連するThreatとAttack Pathを確認する
- [ ] Material Riskを3〜5件以内に絞る
- [ ] Existing ControlとEvidenceを確認する
- [ ] Control GapとResidual Riskを記述する
- [ ] Security Objective案を1〜3件に絞る
- [ ] `templates/objective.md`でObjectiveを作成する
- [ ] 各ObjectiveにBusiness / Risk Outcome KPIを1件以上定義する
- [ ] 定性的なKPIには観測可能な状態、判定条件、期限、Evidenceを定義する
- [ ] KPIのBaselineが不明な場合は確認方法と期限を定義する
- [ ] `registers/objectives.yaml`と`registers/kpis.yaml`を更新する
- [ ] `ruby scripts/validate_repository.rb`を実行する
- [ ] Gate 2: Objective Approvedを実施する

Exit: 企業・組織目標からRisk、Objective、KPI、Evidenceまで追跡できる。

## Phase 4 — Execution Plan

- [ ] 承認済みObjectiveを`strategy/`へ反映する
- [ ] H1 / H2の順序と依存関係を`roadmap/<YEAR>/`へ記載する
- [ ] Initiativeを1〜2件に絞る
- [ ] 各Initiativeに対象RiskとAttack Pathを紐付ける
- [ ] 各InitiativeにRisk Reduction Hypothesisを記載する
- [ ] 各InitiativeにKPI、Owner、Evidence、Residual Riskを記載する
- [ ] `registers/initiatives.yaml`を更新する
- [ ] KPIごとにData SourceとEvidence取得方法を確認する
- [ ] KPI Baselineを取得する
- [ ] Pull RequestでRationale、Unknown、Evidence、Residual Riskをレビューする
- [ ] Decision Authorityの承認後に`main`へ反映する

Exit: 実行施策と成果判定方法が承認され、実績を取得できる。

## Phase 5 — Actual / Evidence Collection

- [ ] KPI Actualを定義済みの単位または状態で記録する
- [ ] Evidence Owner、Evidence Date、Source、Collection Methodを記録する
- [ ] Missing / Stale / Errorを達成扱いしない
- [ ] 月次またはデータ更新時にKPIとEvidenceを更新する
- [ ] 四半期にRisk、Attack Path、Assumption、Unknownの変化を確認する
- [ ] Incident / Near MissがあればBusiness / Risk Impactを記録する
- [ ] `templates/period-results.md`へ期末実績を入力する
- [ ] Gate 3: Results Acceptedを実施する

Exit: Planned / Actual / Variance / Cause / Business or Risk ImpactをEvidence付きで説明できる。

## Phase 6 — Next-period Recommendation

- [ ] `prompts/12-results-to-next-year.md`を実行する
- [ ] ObjectiveごとにContinue / Change / Stop / Complete / Holdを判定する
- [ ] 未達の原因と無効になったAssumptionを確認する
- [ ] Business、Threat、Attack Path、Riskの変化を反映する
- [ ] 次年度ObjectiveとKPI案を作る
- [ ] 提言ごとにEvidence、Confidence、Residual Riskを記載する
- [ ] 提言ごとに反証条件またはRevisit Triggerを設定する
- [ ] 重要判断をDecision Recordへ保存する
- [ ] 関連するRegistersを更新する
- [ ] `ruby scripts/validate_repository.rb`を実行する
- [ ] Gate 4: Next-year Decisionを実施する

Exit: 実績とEvidenceから、次年度の継続・変更・中止理由を再現できる。

## Phase 7 — Pilot Decision and Minimum Hardening

- [ ] `docs/PILOT_GUIDE.md`のPilot KPIを評価する
- [ ] 1レビューサイクルの保守作業時間を確認する
- [ ] 意思決定で実際に利用された成果物を特定する
- [ ] 利用されなかった成果物と理由を特定する
- [ ] Continue / Change / Stop / HoldをDecision Recordへ保存する
- [ ] Continueの場合のみ、次のPilot対象を決める

Evidenceまたは着手条件が得られた項目だけを実装する。

- [ ] 台帳形式が安定した場合、正式YAML SchemaとCI検証を追加する
- [ ] 台帳件数が増えた場合、状態遷移と命名規約を確定する
- [ ] 手動レビュー漏れが観測された場合、Semantic Traceability検査を追加する
- [ ] 1サイクル完了後、Evidence鮮度管理を追加する
- [ ] Data Sourceが承認された後、KPI収集を自動化する
- [ ] 2サイクル以上で形式が安定した後、レビュー生成を半自動化する
- [ ] Git運用が利用障壁だとEvidenceで確認された場合、UIまたは入力支援を検討する

Exit: 実証された問題に対する最小限のHardeningだけが次期計画へ入っている。

## Completion Check

- [ ] Business / Organization GoalからDecisionまで追跡できる
- [ ] 重要なUnknownとAssumptionが残されている
- [ ] Controlが対象RiskとAttack Pathへ接続されている
- [ ] Residual RiskとDecision Authorityが明示されている
- [ ] KPIがBusiness OutcomeまたはRisk Outcomeを測っている
- [ ] KPIに禁止された割合表現がない
- [ ] Evidence不足を達成扱いしていない
- [ ] 別のReviewerが判断理由を再現できる

