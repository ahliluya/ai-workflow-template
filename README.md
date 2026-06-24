# AI_WORKSPACE — Local-first AI Workspace / 本地优先 AI 工作区

## Project Summary / 项目摘要

AI_WORKSPACE 是运行在 Ubuntu 本地环境中的 **local-first AI workspace** 与个人 **AI memory system**。它用于记录想法、增量同步长期记忆、运行规则型 AI 整理流程、执行每日检查，并通过备份校验和 Git 版本控制建立可审计基线。

项目以个人使用和 **solo AI company** 工作流为核心。未来可以在移除私人数据后整理为 public template，但公开模板只应包含通用脚本、规则和文档。

## Core Features / 核心功能

- Local memory capture / 本地记忆记录：使用 `capture` 将想法、决策和进展写入按日期组织的 inbox。
- Incremental sync / 增量同步：`sync_engine` 通过校验和检测变化，只同步新增内容并去重任务。
- AI processing / AI 处理：`ai_engine` 执行清理、语义分类、推理、收敛和抽象。
- Daily review / 每日检查：集中查看系统状态、近期记忆和 concept model。
- Backup verification / 备份验证：对比当前核心文件与已验证的 clean backup。
- Codex workflow / Codex 工作流：由 `AGENTS.md` 和 `docs/CODEX_RULES.md` 约束本地执行边界。
- Agent-to-agent handoff / 智能体协作交接：在 ChatGPT、Codex 和用户之间传递结构化上下文与审查结果。
- Git baseline / Git 基线：保留代码和文档历史，但不把 Git 当作私人记忆备份的替代品。

## Directory Structure / 目录结构

```text
AI_WORKSPACE/
├── AGENTS.md                  # Codex 项目级指令
├── README.md                  # 项目入口文档
├── capture.sh                 # 本地记录入口
├── daily_review.sh            # 每日检查入口
├── compare_backup.sh          # 备份对比入口
├── ai_engine/                 # 规则型 AI 处理管线
├── sync_engine/               # trigger、queue、batch 增量同步
├── agent_bridge/              # 轻量级任务、结果、审查、安全与成本策略
├── docs/                      # 规则、命令和双语说明
├── status/                    # 当前版本与系统状态
├── inbox/                     # 私人原始输入，不应公开
├── memory/                    # 私人长期记忆，不应公开
├── backups/                   # 本地备份，不应公开
├── chat_logs/                 # 私人对话记录，不应公开
└── archive/                   # 历史数据，不应公开
```

## Core Commands / 核心命令

人工终端快捷命令：

```bash
capture "内容"
review
compare_backup
```

Codex 或非交互 shell 入口：

```bash
~/AI_WORKSPACE/capture.sh "内容"
~/AI_WORKSPACE/daily_review.sh
~/AI_WORKSPACE/compare_backup.sh
```

手动运行同步和 AI Engine：

```bash
bash ~/AI_WORKSPACE/sync_engine/trigger/trigger.sh
bash ~/AI_WORKSPACE/sync_engine/queue/queue.sh
bash ~/AI_WORKSPACE/sync_engine/batch/batch.sh
bash ~/AI_WORKSPACE/ai_engine/run_ai_engine.sh
```

更多 Ubuntu command guide / Ubuntu 命令说明见 `docs/COMMANDS.md` 和 `docs/system-guide.md`。

## Agent Bridge Lite / 轻量级 Agent 桥接层

v0.2.0 introduces Agent Bridge Lite, a zero-extra-cost local bridge layer for structured collaboration between the user, ChatGPT, Codex, and AI_WORKSPACE. It provides reusable task, result, and review templates plus execution, safety, and cost policies without OpenAI API automation or background agents.

v0.2.0 引入 Agent Bridge Lite：一个零额外成本的本地桥接层，用于规范用户、ChatGPT、Codex 与 AI_WORKSPACE 的结构化协作。它提供可复用的任务、结果和审查模板，以及执行、安全和成本策略，不使用 OpenAI API 自动化或后台智能体。

See `agent_bridge/README.md` for the workflow and boundaries. / 工作流与边界详见 `agent_bridge/README.md`。

## Safety Boundaries / 安全边界

- 默认只在 `~/AI_WORKSPACE` 内工作。
- 不使用 `sudo`，不修改系统目录、网络、cron 或 shell 启动文件，除非用户明确批准。
- 不自动删除、覆盖、移动或恢复重要文件。
- 不公开或提交私人 memory、inbox、backup、archive、chat log、凭据或账户数据。
- 变更前先检查和计划；变更后进行语法、状态和敏感信息验证。
- `AGENTS.md` 与 `docs/CODEX_RULES.md` 是 Codex workflow 的主要约束文件。

## Version Status / 当前版本

当前文档基线：`v0.2.0-agent-bridge-lite`

当前 Git baseline commit：`2d459d0`。该提交是 v0.1.5 安全模板的初始基线；后续版本在其上完善双语文档，并于 v0.2.0 加入 Agent Bridge Lite 本地协作层。

## Git and Privacy Notes / Git 与隐私说明

Git 用于追踪代码、规则和文档历史。Git 不会自动验证备份完整性，也不应替代 clean backup 与 SHA256 校验。

连接 private GitHub repository 前，应检查 `.gitignore`、运行敏感信息扫描并人工审查待提交文件。即使是 private repository，也不得提交不必要的私人记忆、备份包、日志、绝对用户路径、凭据或账户数据。

准备 public template 时，只保留通用结构、示例和隐私安全的占位内容。真实数据必须留在本地，并在公开前检查完整 Git 历史，而不只是当前工作树。

## Roadmap / 路线图

1. 建立 v0.1.6 bilingual documentation baseline。
2. 审查 `.gitignore` 与 tracked files，准备 private GitHub backup。
3. 分离私人数据与可复用模板内容。
4. 清理示例、路径和账户信息，形成 privacy-safe public template。
5. 完善 agent-to-agent 协作约定和 solo AI company 操作手册。

## Keywords / 关键词

`local-first AI workspace` · `AI memory system` · `Codex workflow` · `agent-to-agent` · `solo AI company` · `backup verification` · `Ubuntu command guide` · `bilingual documentation`
