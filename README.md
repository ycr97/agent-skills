# agent-skills

一个采用 Git 进行版本管理、可重复使用的个人 Agent Skills 集合。

本仓库是个人 Skill 的唯一可信来源，用于沉淀可长期复用的工作流、推理协议和领域实践。不同 Agent 可以共享同一份 Skill，不必为每个工具重复维护临时 Prompt。

## 设计原则

- **沉淀 Skill，而不是堆放 Prompt。** 每个 Skill 都代表一项可复用能力，并明确触发条件、执行方法和完成标准。
- **单一事实来源。** 每个 Skill 只在本仓库维护一份，再安装到不同 Agent 的发现目录。
- **默认保持可移植。** 除非某项能力确实依赖特定运行环境，否则核心指令应与具体 Agent 无关。
- **渐进式披露。** `SKILL.md` 只保留核心流程；详细理论、评价标准、示例和大型参考资料拆分到配套文件中。
- **一切皆可版本化。** 以 Git 历史作为主要版本管理机制。

## Skill 目录

| Skill | 用途 | 状态 |
| --- | --- | --- |
| [`first-principles-learning`](skills/first-principles-learning/) | 通过第一性原理、心智模型、主动练习、苏格拉底式纠错、费曼复述和迁移测试，帮助用户真正理解和掌握复杂主题。 | Stable V1 |

## 仓库结构

```text
agent-skills/
├── README.md
├── AGENTS.md
├── LICENSE
├── skills/
│   └── <skill-name>/
│       ├── SKILL.md
│       ├── references/       # 可选：参考资料
│       ├── scripts/          # 可选：可执行辅助脚本
│       ├── assets/           # 可选：可复用资源或模板
│       └── examples/         # 可选：示例或评测用例
├── scripts/
│   ├── install.sh
│   ├── list.sh
│   └── validate.sh
└── docs/
    ├── skill-authoring-guide.md
    └── agent-integration.md
```

## 安装

克隆仓库：

```bash
git clone git@github.com:ycr97/agent-skills.git ~/Workspace/agent-skills
cd ~/Workspace/agent-skills
```

为 Codex 或兼容 OpenAI Skill 发现机制的 Agent 安装全部 Skill：

```bash
./scripts/install.sh --target codex --all
```

安装单个 Skill：

```bash
./scripts/install.sh --target codex first-principles-learning
```

安装脚本默认使用符号链接，因此检出的仓库始终是本地唯一事实来源。更新仓库后，各 Agent 会直接使用最新版本。

其他 Agent 的接入方式请参阅 [`docs/agent-integration.md`](docs/agent-integration.md)。只有经过确认的 Skill 发现路径才应加入安装脚本。

## 校验

```bash
./scripts/validate.sh
```

校验脚本会检查仓库的最低编写规范，包括目录命名、`SKILL.md` 是否存在、YAML frontmatter 格式，以及必需的 `name` 和 `description` 字段。

## 编写 Skill

从以下入口文件开始：

```text
skills/<lowercase-kebab-case-name>/SKILL.md
```

最小清单：

```markdown
---
name: skill-name
description: 说明该 Skill 的能力、适用场景以及重要的触发边界。
---

执行说明……
```

完整仓库规范请参阅 [`docs/skill-authoring-guide.md`](docs/skill-authoring-guide.md)。

## 范围边界

本仓库只保存可复用的 Agent Skills，明确不包含：

- Agent 应用源代码；
- MCP Server 实现；
- 特定项目的业务代码；
- 尚未沉淀为可复用 Skill 的原始 Prompt 实验；
- 针对不同 Agent 重复复制的同一份 Skill。
