# Interim Information Handling Guideline

## Status

組織の情報分類・保持・削除基準が決まるまでの暫定ガイドライン。正式なPolicyまたはStandardではない。

## Risk and Attack Path

このリポジトリはCrown Jewel、Attack Path、Control Gap、Incident、Evidenceを集約する可能性がある。

```text
機密原本またはSecretをGitへ格納
→ clone / fork / 履歴 / backupへ複製
→ 誤設定またはアカウント侵害
→ 攻撃に有用な情報または認証情報の開示
→ 重要サービス侵害の可能性・事業影響が増加
```

## Interim Rules

組織固有基準が承認されるまで、次を適用する。

- Secret、Password、API Key、Token、Private Keyをコミットしない
- 不要な個人情報をコミットしない
- 詳細な脆弱性再現情報、未加工のIncident記録、機密構成図、機密監査原本をコミットしない
- 機密性が不明な原本はコミットせず、アクセス制御された正本への参照と、必要最小限の要約を記録する
- 外部参照にはOwner、参照先、Evidence date、取得条件を記載する
- AIエージェントに提示可能か不明な情報は入力しない
- 誤格納を発見した場合は通常のファイル削除だけで完了扱いせず、Repository Maintainerと情報管理責任者へ連絡し、履歴・clone・backupへの残存を評価する

## Minimum Evidence Metadata

- Evidence title
- Evidence owner
- Source system / location
- Evidence date
- Collection method
- Related Objective / KPI / Risk
- Access restriction or handling note

## Residual Risk

アクセス制御、保持期間、削除方法、Git履歴からの除去、バックアップ、AI利用条件は組織ルールとして未確定である。本ガイドラインは誤格納の可能性を下げるが、正式な情報ガバナンスを代替しない。
