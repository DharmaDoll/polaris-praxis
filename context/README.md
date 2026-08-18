# Context Input Contract

`context/` is the user-owned input area for one organization and one planning workspace. It is not a general document dump and it is not a substitute for Evidence storage systems.

## Scope

- One repository should represent one approved organizational workspace unless a separate data-isolation decision says otherwise.
- `context/manifest.yaml` identifies the organization, period, owners, classification, and workspace status.
- `context/business/` contains Company / Organization goals, Values, Priority Initiatives, and Constraints.
- `context/organization/` contains organization mission, mandate, structure, and decision context.
- `context/assets/` contains relevant services, assets, and Crown Jewels.
- `context/architecture/` contains architecture or dependency context needed for attack-path reasoning.
- `context/constraints/` contains budget, capacity, regulatory, contractual, and timing constraints.

## Input Rules

1. Use one planning input file per organization and period, for example `business/planning-input-2026-org-a.md`.
2. Label material claims as `Fact`, `Unknown`, `Assumption`, `Hypothesis`, `Decision`, or `Evidence`.
3. Record source, owner, review date, and classification where applicable.
4. Do not invent missing organizational facts. Use `Unknown` and register decision-relevant gaps in `registers/unknowns.yaml`.
5. Do not copy values, IDs, Evidence, or Decisions from `examples/`; those files are Synthetic and non-authoritative.
6. Do not store credentials, secrets, unnecessary personal data, or restricted originals in this repository.
7. Keep drafts and unapproved agent output under `drafts/`, not in authoritative registers or approved strategy files.

## Agent Intake Contract

Before analysis, an agent must read:

1. Root `AGENTS.md`
2. `vision/`
3. `context/manifest.yaml`
4. The relevant period's files under `context/`
5. The requested Prompt and Template

The agent must first return its current understanding, missing information, assumptions, and proposed output location. It must not update authoritative files before human review.

