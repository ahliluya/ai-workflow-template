# System Guide / 系统说明

## System Overview / 系统概览

AI_WORKSPACE 是在 Ubuntu 上运行的 **local-first AI workspace** 与个人 **AI memory system**。系统把本地记录、增量同步、规则型 AI 处理、每日检查、backup verification 和 Codex workflow 组织为可审计流程。

本文件是现有长篇中文系统指南的 English-filename、双语精简版本。旧文件 `AI_WORKSPACE_系统说明_备份对比_发送给ChatGPT指南.md` 保留，供历史细节和旧引用使用。

## Capture / 记忆记录

人工终端命令：

```bash
capture "想法、决策、问题或项目进展"
```

Codex 或非交互 shell：

```bash
~/AI_WORKSPACE/capture.sh "想法、决策、问题或项目进展"
```

`capture.sh` 将时间戳和输入追加到 `inbox/YYYY-MM-DD.md`。inbox 是私人原始输入，不应提交到公开模板。

## Sync Engine / 同步引擎

`sync_engine` 将当天 inbox 的新增内容同步到 global memory：

1. `trigger/trigger.sh` 计算当天 inbox 的 SHA256；只有内容变化时才创建同步请求。
2. `queue/queue.sh` 对同步请求排序和去重。
3. `batch/batch.sh` 根据已同步行数，仅把新增行追加到 `memory/global/global_memory.md`，然后清空已处理队列。

手动运行：

```bash
bash ~/AI_WORKSPACE/sync_engine/trigger/trigger.sh
bash ~/AI_WORKSPACE/sync_engine/queue/queue.sh
bash ~/AI_WORKSPACE/sync_engine/batch/batch.sh
```

这些命令会修改同步状态、队列、日志和 global memory；执行前应确认这是预期操作。

## AI Engine / AI 引擎

```bash
bash ~/AI_WORKSPACE/ai_engine/run_ai_engine.sh
```

处理顺序为 clean、semantic classification、reasoning、brain processing、convergence、abstraction。最终 concept model 位于 `ai_engine/abstraction/concept_model.md`。

当前 AI Engine 是本地规则型处理管线。文档不应把它描述为远程模型服务，也不应假设存在 API 凭据。

## Daily Review / 每日检查

人工终端使用 `review`；Codex 或非交互 shell 使用：

```bash
~/AI_WORKSPACE/daily_review.sh
```

该流程显示系统状态和近期 global memory，运行 AI Engine，再输出 concept model。它会读取私人记忆并更新 AI Engine 产物，因此输出不应直接发布。

## Compare Backup / 备份对比

人工终端使用 `compare_backup`；Codex 或非交互 shell 使用：

```bash
~/AI_WORKSPACE/compare_backup.sh
```

脚本选择最新的 v0.1.5 clean backup，在 `/tmp` 中提取副本，并对比 global memory、版本、系统状态、命令文档、 Codex rules 和 `AGENTS.md`。提取错误或真实差异会返回非零状态；脚本不会恢复或覆盖当前工作区。

## AGENTS.md / 项目级代理指令

根目录 `AGENTS.md` 定义项目目的、角色、默认工作目录、安全规则、必读文件、核心命令和报告格式。Codex 执行任务时，应先遵守该文件并读取 `docs/CODEX_RULES.md`。

## CODEX_RULES.md / Codex 执行规则

`docs/CODEX_RULES.md` 提供详细权限边界和操作流程，包括检查、计划、执行、验证、报告，以及对 sudo、系统目录、网络、cron、恢复和包安装等高风险操作的限制。

两份规则冲突时采取更安全的解释；任务不明确或风险较高时，停止并请求用户批准。

## Git Safety / Git 安全

- Git 记录代码和文档历史；它不是 memory backup 或 SHA256 backup verification 的替代品。
- 提交前检查 `git status --short`、待提交 diff、tracked files 和 untracked candidates。
- private repository 仍需遵守最小数据原则，不提交私人记忆、备份、日志、凭据、账户数据或不必要的绝对路径。
- public template 发布前还要检查完整 Git history，防止已删除的敏感内容仍存在于历史提交。
- 不重写当前 Git commit history，除非用户单独审批历史清理任务。

## Backup Verification / 备份验证

备份完整性和内容一致性是两个不同检查：

1. SHA256 verification / 校验和验证：在 `backups/` 中运行对应版本的 `sha256sum -c` 清单，确认归档未损坏或被替换。
2. Content comparison / 内容对比：运行 `compare_backup`，确认当前核心文件与选定 clean backup 是否存在差异。

只有 SHA256 返回 `OK` 才能把归档视为已验证备份。存在 diff 不一定代表错误，但必须分析差异来源；未经明确批准，不得恢复备份。

## Agent-to-agent Workflow / 智能体协作流程

ChatGPT 负责架构、审查和推理；Codex 负责本地检查、执行和验证；用户负责高风险操作的最终审批。交接时提供版本、相关文件、验证命令和实际结果，不传递私人 memory、credentials 或无关日志。

## Search Keywords / 检索关键词

`local-first AI workspace` · `AI memory system` · `Codex workflow` · `agent-to-agent` · `solo AI company` · `backup verification` · `Ubuntu command guide` · `bilingual documentation`
