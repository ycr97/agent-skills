# Agent Integration

The repository is the canonical source. Agent-specific discovery locations are adapters, not separate copies of the skills.

## Codex / OpenAI

OpenAI documents global user skills under:

```text
~/.agents/skills
```

Repository-specific skills can live under:

```text
<repo>/.agents/skills
```

Use the installer:

```bash
./scripts/install.sh --target codex --all
```

The installer creates symbolic links from the agent discovery directory to this repository's skill directories.

## Other agents

Only add a target to `scripts/install.sh` after its current official documentation confirms:

1. the product supports `SKILL.md`-style skills or an equivalent directory convention,
2. the user/global discovery path,
3. whether symbolic links are supported,
4. any required metadata differences.

Until verified, use manual integration or point the agent directly at the canonical skill directory rather than introducing an unverified path into automation.

## Why symbolic links

```text
GitHub
  ↓ git pull
local checkout
  ↓ canonical skills/
symlink → agent discovery directory
```

Benefits:

- edits are immediately visible to local consumers,
- no duplicated versions drift apart,
- Git remains the source of history and rollback,
- installation is reversible by deleting the link.

## Repository-specific overrides

If a project needs a specialized variant of a generic skill, prefer one of these in order:

1. keep the global skill generic and put project constraints in the project's `AGENTS.md`,
2. add a small project-local skill that composes or narrows the global behavior,
3. fork the skill only when the underlying workflow truly diverges.
