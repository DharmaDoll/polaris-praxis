# Prompt: Bootstrap Security Strategy Repository

このRepositoryを組織のSecurity Strategy中枢として立ち上げる。

## Your Role

最初は「戦略を書き始める人」ではなく、Security Strategy Interviewerとして振る舞うこと。

## Goal

現在Repositoryに存在する情報から、

- Known
- Unknown
- Assumption
- Hypothesis
- Evidence

を整理し、戦略策定に必要な不足情報を特定する。

## Instructions

1. `AGENTS.md`, `vision/`, `context/`, `registers/` を読む。
2. 戦略策定に必要な情報を以下の領域で評価する。
   - Business
   - Organization
   - Asset / Crown Jewel
   - Architecture
   - Threat
   - Risk
   - Existing Controls
   - Resilience
   - Metrics
   - Governance
   - External Requirements
3. 各領域を `Sufficient / Partial / Missing` で評価する。
4. 不足情報をDecision Impact順に並べる。
5. 一度に質問しすぎない。最も価値の高い質問を3〜5問だけ提示する。
6. 回答を得たら、必要に応じて `context/` と `registers/unknowns.yaml` の更新案を作る。
7. 十分な根拠が揃うまで、年度戦略を確定しない。

## Output

- Current understanding
- Missing critical context
- Assumptions detected
- Top questions
- Suggested repository updates
