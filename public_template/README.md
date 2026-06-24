# AI_WORKSPACE Public Template / AI_WORKSPACE 公开模板

## What this is / 这是什么

AI_WORKSPACE Public Template is a beginner-friendly, local-first AI workflow template. It helps a solo builder coordinate the User, ChatGPT, Codex, and Git through clear tasks, local execution, human review, and version control.

AI_WORKSPACE 公开模板是一个适合初学者的本地优先 AI 工作流模板。它帮助个人开发者通过清晰任务、本地执行、人工审查和版本控制，协调用户、ChatGPT、Codex 与 Git。

This is a public-safe template, not the original private workspace. It is suitable for learning, workflow prototyping, and **solo AI company** experiments.

这是一个适合公开使用的安全模板，并非原始私人工作区。它适用于学习、工作流原型设计和个人 AI 公司实验。

## What this is not / 这不是什么

This template is not an autonomous agent system, a hosted service, or a copy of private operational history. It contains no personal memory, inbox content, logs, backups, tokens, secrets, personal data, or private history.

本模板不是自主智能体系统、托管服务，也不是私人运营历史的副本。它不包含个人记忆、inbox 内容、日志、备份、Token、密钥、个人数据或私人历史。

## Core workflow / 核心工作流

1. The User defines the goal and remains final approver. / 用户定义目标并保留最终审批权。
2. ChatGPT acts as architect and reviewer. / ChatGPT 作为架构师和审查者。
3. Codex acts as the local executor. / Codex 作为本地执行者。
4. Git records reviewed changes. / Git 记录已审查的变更。
5. The local workspace keeps project state under human control. / 本地工作区在人类控制下保存项目状态。

## Folder structure / 目录结构

```text
public_template/
├── README.md
├── README_PUBLIC.md
├── LICENSE
├── structure.txt
├── agent_bridge/
├── docs/
└── examples/
```

See `docs/structure.md` and `structure.txt` for details. / 详细说明见 `docs/structure.md` 和 `structure.txt`。

## Safety principles / 安全原则

- Inspect before modifying and verify afterward. / 修改前先检查，修改后再验证。
- Keep secrets and personal data out of Git. / 不在 Git 中保存密钥和个人数据。
- Require human approval for destructive or high-risk actions. / 破坏性或高风险操作必须经过人工批准。
- Work within an explicit file and command scope. / 在明确的文件和命令范围内工作。

## Cost principles / 成本原则

The default workflow uses zero extra API cost. It assumes manual ChatGPT and Codex usage without API billing, automatic loops, or background agents. Paid API use must be separately reviewed and explicitly approved.

默认工作流不产生额外 API 成本。它采用人工使用 ChatGPT 与 Codex 的方式，不启用 API 计费、自动循环或后台智能体。付费 API 使用必须单独审查并明确批准。

## Recommended usage / 推荐用法

Start with `docs/getting-started.md`, copy `agent_bridge/task-template.md`, keep each task small, let Codex report with `result-template.md`, and review the result before committing.

从 `docs/getting-started.md` 开始，复制 `agent_bridge/task-template.md`，保持任务小而明确，让 Codex 使用 `result-template.md` 报告，并在提交前审查结果。

## Future extensions / 后续扩展

Possible extensions include project-specific checklists, local scripts, testing policies, approval gates, and optional private memory stored outside the public repository. Add automation gradually and review privacy, safety, and cost first.

后续可扩展项目专用清单、本地脚本、测试策略、审批门，以及保存在公开仓库之外的可选私人记忆。自动化应逐步添加，并优先审查隐私、安全和成本。
