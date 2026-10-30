# Examples

このディレクトリには、利用方法を確認するための架空データだけを置く。

## 最初に見るサンプル

| 使いたい場面 | サンプル | 読めるもの |
|---|---|---|
| 半期・年度末に、チーム・機能別の実績と次期の重点を整理したい | [簡易レビュー](quick-review/) | AppSecチームの入力・評価案と、他の機能の目標例。資料未確認の場合も掲載 |
| Product Securityの技術的な根拠まで詳しく検討したい | [Product Security Controls](product-security-controls/) | 会社・組織目標、現状、承認済み計画、実績の詳細な入力例 |

まずは簡易レビューの入力と出力を見比べ、自分の目標・実績に置き換えて使う。

## Separation Rules

- `examples/`配下の内容はすべて`Synthetic`であり、組織のFact、Evidence、Decisionではない
- サンプルIDをrootの`registers/`へ登録しない
- サンプルから生成した出力は、各サンプルの`generated/`配下に保存する
- サンプルを実組織へ流用する場合は、新しい`planning/*`ブランチでFactとEvidenceを置き換え、Decision Authorityの承認を得る
- 外部リファレンスの実装済み・成熟度・Evidence levelを、サンプル組織への導入済み状態として扱わない

rootの`main`は承認済みの現在状態、`examples/`は非正本の学習・動作確認用という境界を維持する。
