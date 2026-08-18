# AGENTS.md — Security Strategy OS

## Mission

This repository is the system of record for organizational cybersecurity strategy.

The goal is not to generate documents.
The goal is to continuously connect:

```text
Company Vision / Values / Annual Goals
→ Organization Mission / Annual / Period Goals / Priority Initiatives
→ Business
→ Assets
→ Threats
→ Attack Paths
→ Risks
→ Controls
→ Residual Risks
→ Resilience
→ Strategy
→ Execution
→ KPI / Evidence
→ Learning
```

## Non-Negotiable Rules

1. Never invent organizational facts.
2. Distinguish `Fact`, `Unknown`, `Assumption`, `Hypothesis`, `Decision`, and `Evidence`.
3. If information is insufficient for a defensible conclusion, identify the missing information before finalizing.
4. Never recommend a control without stating which risk and attack path it reduces.
5. Never prioritize a vulnerability only by technical severity.
6. Always connect security priorities to Business / Mission impact.
7. Consider Intrinsic Value, Path/Positional Value, and Operational Value when evaluating assets.
8. Prefer risk outcomes and business outcomes over activity metrics.
9. Evaluate existing controls before proposing new controls.
10. Explicitly state Residual Risk after proposed controls.
11. Assume prevention can fail; evaluate Detect, Respond, Recover, and cyber resilience.
12. Strategic claims must have evidence, or be explicitly labeled as assumptions/hypotheses.
13. Do not silently convert assumptions into facts.
14. Preserve traceability from strategy → initiative → metric → evidence.
15. Prefer the minimum sufficient control set over indiscriminate control accumulation.
16. Security strategy must enable business objectives rather than exist independently.
17. When frameworks conflict with organizational reality, explain the gap rather than forcing artificial compliance.
18. Use external frameworks as objective reference points, not as substitutes for risk reasoning.
19. When creating executive material, preserve the underlying evidence and uncertainty.
20. Every major recommendation should be falsifiable or measurable where practical.
21. Every Objective and Initiative must have at least one KPI. Express qualitative outcomes as observable state-based KPIs when appropriate. Never express a KPI as a percentage, rate, ratio, or proportion.
22. For annual or period planning, begin with Company and Organization Vision, Values, Goals, Priority Initiatives, and Constraints; produce Security Objectives and KPI; later compare Actuals and Evidence to produce next-period recommendations.
23. Treat every file under `examples/` as Synthetic and non-authoritative. Never copy sample IDs, values, Evidence, or Decisions into root registers or approved artifacts without replacing them with reviewed organizational facts and passing the normal Decision Gates.

## Default Reasoning Model

For strategic security analysis, use:

```text
Company / Organization Goals
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
```

## Required First Step for New Strategic Work

Before drafting a strategy, plan, standard, guideline, or executive presentation:

1. Inspect available context.
2. Identify relevant facts.
3. Identify missing information.
4. Identify assumptions.
5. Determine whether the requested output can be responsibly produced.
6. If not, ask the minimum number of highest-value questions.
7. Add unresolved items to `registers/unknowns.yaml`.

## Evidence Standard

For every material assertion, prefer one or more of:

- internal metrics
- architecture/configuration evidence
- incident data
- audit/assessment evidence
- threat intelligence
- vulnerability/attack-path evidence
- approved business plans
- regulatory/contractual requirements
- authoritative frameworks

When evidence is absent:

```text
Evidence Status: Missing
Confidence: Low
```

Do not disguise absence of evidence with polished prose.

## Framework Baseline

Use as reference coordinates where appropriate:

- NIST CSF 2.0
- NIST RMF
- NIST SP 800-53
- NIST SP 800-160 Vol.2
- NIST SSDF
- MITRE ATT&CK
- MITRE Attack Flow
- MITRE Crown Jewels Analysis concepts
- CIS Controls
- ISO/IEC 27001 / 27002
- OWASP ASVS
- OWASP SAMM
- SLSA

Framework mapping must remain secondary to organizational risk.

## Asset Valuation

Evaluate assets using three dimensions:

- Intrinsic Value
- Path / Positional Value
- Operational Value

A low-intrinsic-value system may still be critical if it is a gateway to Crown Jewels.

## Metrics Hierarchy

Prefer metrics in this order:

1. Business Outcome
2. Risk Outcome
3. Security Capability
4. Activity

Avoid using activity metrics as proof of risk reduction.

Every Objective and Initiative must have at least one KPI. KPI values must use absolute counts, elapsed time, dates, monetary amounts, absolute quantities, or explicitly defined observable states. Do not use percentages, rates, ratios, proportions, coverage rates, achievement rates, or compliance rates. When the size of a population matters, record the total population and the qualifying count as separate absolute values without dividing them.

## Git / Branch Policy

`main` = approved current state.

Use branches for:

- `strategy/*`
- `planning/*`
- `initiative/*`
- `scenario/*`
- `option/*`
- `experiment/*`
- `agent/*`

Do not create long-lived branches for individual assets, risks, or controls.

Before merging to `main`, confirm:

- rationale is documented
- evidence exists or uncertainty is explicit
- impacted risks are linked
- metrics are defined
- residual risk is stated
- owner / decision authority is clear

## Output Quality Gate

Before considering work complete, self-review:

- Is this grounded in business context?
- Are important unknowns explicit?
- Is attack-path reasoning present where relevant?
- Are proposed controls linked to risks?
- Is residual risk discussed?
- Are measurable outcomes defined?
- Are framework mappings accurate and non-dominant?
- Can a reviewer trace why this decision was made?
- Could another person reproduce the reasoning from repository evidence?

If not, revise.
