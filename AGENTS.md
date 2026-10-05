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

## 表达与交付

- 默认用中文。先给结论或执行结果，再解释依据和必要细节。
- 使用直接、具体的技术表达。明确触发条件、执行主体、操作对象和结果；同一概念保持同一名称。
- 简化表达，不降低技术深度。保留影响判断的前提、边界、失败条件和不确定性；区分已验证事实、假设和推断。
- 操作步骤按执行顺序排列。避免空泛措辞；缺乏证据时明确说明不确定性，不为使表达具体而编造实现细节。
- 根据问题选择最有助于理解的形式：操作使用步骤和命令；比较使用表格；依赖、流程和状态变化使用 Mermaid；参数变化或动态机制在交互明显有益时使用 HTML。
- 使用足以解释问题的最简单形式。简单任务直接回答，不为装饰生成图表、网页或视频。
- 完成工程修改后，说明实际行为变化、关键原因、已执行的验证及尚未验证的部分。重要结论指向代码、配置、日志或测试等可核查证据。
- 这些规则约束沟通和说明；用户指定的文档风格、产品文案和机器可读格式优先。
