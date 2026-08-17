# Branching Strategy

## Principle

> `main`には現在承認されている真実を置き、Branchでは未来・仮説・選択肢を扱う。

## Branch Types

### `strategy/*`

次年度・中長期戦略の策定。

例:

```text
strategy/fy2027
strategy/three-year-2027-2029
```

### `planning/*`

半期・四半期の計画策定。

```text
planning/fy2027-h1
planning/fy2027-h2
```

計画確定後は`main`へmergeし、長寿命化しない。

### `initiative/*`

大規模Security Initiative。

```text
initiative/identity-security
initiative/cloud-security-baseline
```

### `scenario/*`

What-ifまたはThreat Scenario。

```text
scenario/budget-minus-30
scenario/idp-compromise
scenario/ransomware
```

### `option/*`

Control / Architectureの選択肢比較。

```text
option/pam-a
option/pam-b
```

### `experiment/*`

Metrics / Framework / Agent Workflowの検証。

### `agent/*`

Codexによる大規模変更・ドラフト。

## Merge Criteria

`main`へmergeする前に以下を満たす。

- rationale
- evidence
- impacted risks
- metrics
- residual risk
- owner
- decision authority
- unresolved unknowns
