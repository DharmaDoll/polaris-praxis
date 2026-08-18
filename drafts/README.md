# Agent Draft Workspace

`drafts/` contains unapproved agent output for the current workspace. It is a staging area, not the source of truth.

## Allowed contents

- Intake summaries and missing-information questions
- Security Objective and KPI drafts
- Risk / Attack Path / Control traceability drafts
- Evidence review and next-period recommendation drafts
- Suggested repository updates for human review

## Promotion rule

An agent must not promote its own output. A human reviewer and the applicable Decision Authority must confirm the draft before content is copied into `registers/`, `strategy/`, `roadmap/`, or `initiatives/`.

Use a workspace and period path when more than one draft exists, for example:

```text
drafts/ORG-A-2026/
  intake-review.md
  objective-kpi-draft.md
  review-questions.md
```

Every draft should state its input files, Evidence Status, Confidence, authoring agent, date, and review status.

