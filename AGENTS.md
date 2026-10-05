# Repository Guidelines

## Purpose

This repository is the canonical source for reusable Agent Skills. Preserve portability, clarity, and progressive disclosure.

## Core Rules

1. Treat each directory under `skills/` as an independently usable skill package.
2. Every skill MUST contain `SKILL.md` with YAML frontmatter containing `name` and `description`.
3. Skill directory names and `name` values MUST use lowercase kebab-case and MUST match.
4. `description` MUST state both capability and activation context. Put the most important trigger semantics early.
5. Keep `SKILL.md` focused on operational instructions. Move extended theory, rubrics, large examples, and reference material to `references/` or `examples/`.
6. Keep core skills agent-agnostic. Agent-specific discovery/install logic belongs in repository-level integration documentation or installer code.
7. Do not duplicate the same skill into per-agent variants unless the underlying behavior truly differs.
8. Prefer the smallest sufficient change. Do not refactor unrelated skills when editing one skill.
9. Do not add speculative abstractions, metadata, or compatibility layers without a concrete consumer.
10. Run `./scripts/validate.sh` after changing skill structure or metadata.

## Skill Quality Bar

A mature skill should make clear:

- when it should activate,
- when it should not activate,
- what outcome it is trying to produce,
- how the agent should execute the workflow,
- how to diagnose failure or uncertainty,
- what completion means.

For non-trivial skills, include examples or evaluation cases that demonstrate both correct activation and boundary cases.

## Repository Boundaries

Do not add:

- agent application code,
- unrelated project source code,
- MCP server implementations unless they are strictly helper resources for a skill,
- transient scratch prompts,
- secrets or machine-specific credentials.
