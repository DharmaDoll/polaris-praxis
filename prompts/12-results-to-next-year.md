# Prompt: Results to Next-year Recommendations

承認済みObjectiveとKPIに対する実績を評価し、次期・次年度への提言を作る。

## Inputs

- Company / Organization goals for the reviewed period
- Approved Objectives
- KPI definitions and Baselines / Targets
- KPI Actuals
- Evidence
- Initiative results
- Material business, threat, risk, and control changes
- Incidents / Near Misses
- Invalidated Assumptions and resolved Unknowns

実績入力には `templates/period-results.md` を使用できる。

### チーム・機能別の目標を評価する場合

会社・部門の目標に対して、対象チームがどの役割を担い、今期どの成果を約束したかを確認する。担当製品・工程・権限・依存先を評価範囲として明記する。

- **担当範囲の成果と共同成果を分ける。** チームの成果が確認できても、共同成果の未達や残余リスクは残す。共同成果が未達という理由だけで、チーム自身の担当分を未達と断定しない。
- 連携上の未解決事項について、チーム側の支援・相談・エスカレーションと、他の責任者が決めることを区別する。担当外として問題を放置する提言にしない。
- 件数は活動量として記録し、判断の品質、開発への定着、リスクや事業への貢献を別に評価する。件数が多い機能を一律に高く評価しない。
- 定常業務の維持と改善重点の進捗を分ける。基盤づくりは観測可能な状態で評価し、実績のない事故削減や売上効果を主張しない。
- 承認済みの評価尺度・重み付けがなければ、独自の総合点や人事評価等級を作らない。

## Method

各ObjectiveとInitiativeを次の順に評価する。

```text
Planned Outcome
→ KPI Baseline / Target / Actual
→ Evidence
→ Variance
→ Cause
→ Business / Risk Impact
→ Residual Risk
→ Continue / Change / Stop / Complete / Hold
→ Next-period Recommendation
```

## Rules

- 実績またはEvidenceがない場合は推測せず、`Evidence Status: Missing`、`Confidence: Low` とする。
- KPIは定義済みの単位または状態判定で評価する。
- 割合、パーセント、率、比率、分数表現を新たに生成しない。
- 未達だけを理由に継続を提言しない。仮説、原因、事業環境、リスク変化を評価する。
- 達成済みの活動を成果と混同しない。
- 次年度提言は企業・組織目標、対象リスク、Attack Path、既存Control、期待成果、KPI、残余リスクへ接続する。
- 提言ごとに、反証または再検討の条件を定義する。
- AI出力を承認済みDecisionとして扱わない。

## Output

1. Executive summary
2. Objective and KPI results
3. Variance and cause analysis
4. Business / risk outcome changes
5. Continue / Change / Stop / Complete / Hold recommendations
6. Proposed next-year Objectives and KPI
7. Initiative recommendations
8. Residual risks
9. Missing evidence and confidence
10. Decisions required
11. Suggested repository updates

## 簡易レビュー

利用者がQuick Startまたは「簡易レビュー」を指定した場合は、上記の分析要件を保ち、次の形式で提示する。

### 入力の受け付け方

- 目標シート、週報、議事録、会話のメモから受け付ける。初回でも評価時期から使えるようにし、全テンプレートや台帳の完成を前提にしない。
- `AGENTS.md`、`vision/`、`context/manifest.yaml`と関連Contextを読み、会社・組織の方針、対象期の目標と承認済みの達成条件を確認する。次期提言には次期の方針・重点施策・制約も使い、不明な場合はその適合性を未確認とする。
- 最初に理解した対象・期間、重要な不足情報、仮定、出力先を短く示す。既存情報の再入力を求めない。
- 利用者の申告、実際に確認したEvidence、原因の仮説を分ける。資料名やURLだけがある場合、その内容を確認済みとしない。
- **組織目標への貢献を評価する。** 作業件数や施策の完了は実行状況として扱い、事業成果やリスク低減を別に評価する。売上・受注等への寄与は、根拠がなければ因果関係を断定しない。
- 正式なKPI・達成条件の有無が未確認なら「判断保留（基準未確認）」とする。未設定であることが確認できた場合は「評価基準未設定」とし、実績の整理と次期KPI案を出す。後付けの目標で当期の達成・未達を判定しない。
- 情報不足でも、評価できる範囲と判断保留の範囲を分けて案を出す。全体の作業を止めて大量の質問をしない。結論に必要な質問は優先順に最大3つとする。

### 最初に読む部分：会議用の評価案

1ページ程度を目安に、次の3点を示す。

1. **今回の評価**：総括と、目標ごとの達成条件・実績・判定・根拠。判定は「達成 / 未達 / 判断保留 / 評価基準未設定」を使う。数字の改善と目標達成を混同しない。
2. **次期の方針案**：目標・施策ごとに「継続 / 変更 / 中止 / 完了 / 保留」（Continue / Change / Stop / Complete / Hold）と理由を示す。必要な次期Objective・KPI・Initiative、担当・期限の案を添える。
3. **決めること**：責任者に判断してほしいことと、追加で確認すること。未確認事項は誰に何を確認すればよいか示し、担当が不明なら割当を求める。

不足・矛盾・古いEvidenceは見える位置で示す。Evidenceがなければ`Evidence Status: Missing / Confidence: Low`とする。判断保留は、必要な確認やリスク対応まで止める意味ではない。達成した場合も、維持運用を続ける必要があるかを区別する。

新たな目標値・担当・期限は「提案」と明記し、当期の承認済み計画と混ぜない。各ObjectiveとInitiativeにKPIを紐付ける。制約を超える施策を一括で勧めず、順序と見送る範囲を示す。重要な残余リスクは本文に残す。

### 必要なときに読む部分：根拠と判断の補足

詳細は末尾の`<details>`にまとめる。入力資料、Evidenceの対象範囲・日付、目標→Risk / Attack Path→既存Control / Gap→施策→KPI→Evidenceの対応、原因の仮説、残余リスク、再検討条件を追跡可能にする。資産の3つの価値、Detect / Respond / Recoverも関連する範囲で評価する。本文の簡潔さのために不確実性を隠さない。

出力は未承認ドラフトとする。保存する場合は対象が分かる`drafts/`配下へ置き、入力・作成日・作成者・レビュー状態を残す。Unknownは登録案として整理し、利用者のレビュー前に正本や台帳へ反映しない。Syntheticサンプルの出力はそのサンプルの`generated/`だけに保存する。
