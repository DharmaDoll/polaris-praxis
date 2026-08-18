# Examples

このディレクトリには、利用方法を確認するための架空データだけを置く。

## Separation Rules

- `examples/`配下の内容はすべて`Synthetic`であり、組織のFact、Evidence、Decisionではない
- サンプルIDをrootの`registers/`へ登録しない
- サンプルから生成した出力は、各サンプルの`generated/`配下に保存する
- サンプルを実組織へ流用する場合は、新しい`planning/*`ブランチでFactとEvidenceを置き換え、Decision Authorityの承認を得る
- 外部リファレンスの実装済み・成熟度・Evidence levelを、サンプル組織への導入済み状態として扱わない

rootの`main`は承認済みの現在状態、`examples/`は非正本の学習・動作確認用という境界を維持する。
