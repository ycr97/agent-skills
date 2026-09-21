# agent-skills

A personal, version-controlled collection of reusable Agent Skills.

This repository is the canonical source for skills that encode durable workflows, reasoning protocols, and domain practices so they can be reused across compatible agents instead of being duplicated as ad-hoc prompts.

## Principles

- **Skill, not prompt dump.** Each skill represents a reusable capability with activation rules, execution guidance, and completion criteria.
- **Single source of truth.** A skill is maintained once in this repository and installed into agent-specific discovery locations.
- **Portable by default.** Keep core skill instructions agent-agnostic unless a capability genuinely depends on a specific runtime.
- **Progressive disclosure.** Keep `SKILL.md` focused; move detailed theory, rubrics, examples, and large references into companion files.
- **Version everything.** Git history is the primary versioning mechanism.

## Skill catalog

| Skill | Purpose | Status |
| --- | --- | --- |
| [`first-principles-learning`](skills/first-principles-learning/) | Teach and learn complex topics through first principles, mental models, active practice, Socratic correction, Feynman explanation, and transfer testing. | Stable V1 |

## Repository layout

```text
agent-skills/
├── README.md
├── AGENTS.md
├── LICENSE
├── skills/
│   └── <skill-name>/
│       ├── SKILL.md
│       ├── references/       # optional supporting material
│       ├── scripts/          # optional executable helpers
│       ├── assets/           # optional reusable assets/templates
│       └── examples/         # optional examples/evaluations
├── scripts/
│   ├── install.sh
│   ├── list.sh
│   └── validate.sh
└── docs/
    ├── skill-authoring-guide.md
    └── agent-integration.md
```

## Install

Clone the repository:

```bash
git clone git@github.com:ycr97/agent-skills.git ~/Workspace/agent-skills
cd ~/Workspace/agent-skills
```

Install all skills for Codex / OpenAI-compatible global discovery:

```bash
./scripts/install.sh --target codex --all
```

Install one skill:

```bash
./scripts/install.sh --target codex first-principles-learning
```

The installer uses symbolic links by default, so the checked-out repository remains the single local source of truth.

For other agents, see [`docs/agent-integration.md`](docs/agent-integration.md). Only verified discovery paths should be added to the installer.

## Validate

```bash
./scripts/validate.sh
```

The validator checks the repository's minimum authoring contract: directory naming, `SKILL.md` existence, YAML frontmatter, and required `name` / `description` fields.

## Authoring a skill

Start with:

```text
skills/<lowercase-kebab-case-name>/SKILL.md
```

Minimum manifest:

```markdown
---
name: skill-name
description: What this skill does, when to use it, and important trigger boundaries.
---

Instructions...
```

See [`docs/skill-authoring-guide.md`](docs/skill-authoring-guide.md) for the full repository convention.

## Scope

This repository stores reusable Agent Skills. It deliberately does **not** store:

- application source code for agents,
- MCP server implementations,
- project-specific business code,
- raw prompt experiments that have not matured into a reusable skill,
- duplicated copies of the same skill for different agents.
