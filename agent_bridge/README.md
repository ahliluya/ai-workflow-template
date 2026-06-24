# Agent Bridge Lite / 轻量级 Agent 桥接层

## Overview / 概览

Agent Bridge Lite is a zero-extra-cost local coordination layer for structured work between a user, ChatGPT, Codex, and AI_WORKSPACE. It standardizes task input, local execution reports, human review, safety boundaries, and cost boundaries for a **local-first AI workspace** and **AI memory system**.

Agent Bridge Lite 是零额外成本的本地协作层，用于规范用户、ChatGPT、Codex 与 AI_WORKSPACE 之间的结构化工作，包括任务输入、本地执行报告、人工审查、安全边界和成本边界。

## What It Is / 它是什么

- Reusable Markdown templates and policies for an **agent bridge** workflow. / 用于 Agent 桥接工作流的可复用 Markdown 模板与策略。
- An **agent-to-agent lite** handoff convention with human approval. / 保留人工审批的轻量级智能体交接约定。
- A practical **Codex workflow** for scoped local execution and fixed-format reporting. / 面向有限范围本地执行和固定格式报告的 Codex 工作流。
- A foundation for a privacy-aware **solo AI company**. / 注重隐私的个人 AI 公司工作流基础。

## What It Is Not / 它不是什么

It is not autonomous agent-to-agent automation, an API integration, a background service, a scheduler, or a replacement for human judgment. It does not send local memory or project data to external services.

它不是自主的智能体间自动化、API 集成、后台服务或调度器，也不替代人工判断。它不会把本地记忆或项目数据发送到外部服务。

## Why It Avoids API Cost / 为什么不产生 API 费用

The Lite baseline uses documents, local files, ChatGPT Plus, and included Codex CLI usage. It creates no API keys, makes no OpenAI API calls, runs no automatic loops, and starts no background agents. Its default model therefore has **zero API cost** and zero extra infrastructure cost.

Lite 基线使用文档、本地文件、ChatGPT Plus 与已包含的 Codex CLI 使用额度。它不创建 API 密钥、不调用 OpenAI API、不运行自动循环，也不启动后台智能体，因此默认是零 API 成本和零额外基础设施成本。

## Cooperation Model / 协作模型

- User / 用户：defines goals, approves risk, reviews results, and makes final decisions. / 定义目标、批准风险、审查结果并作出最终决定。
- ChatGPT / ChatGPT：acts as architect and reviewer; it clarifies scope and evaluates results. / 作为架构师和审查者，明确范围并评估结果。
- Codex / Codex：acts as local executor; it inspects, plans, edits within scope, verifies, and reports. / 作为本地执行者，检查、计划、在范围内修改、验证并报告。
- AI_WORKSPACE / AI_WORKSPACE：stores local project state and approved documentation under existing privacy rules. / 按既有隐私规则保存本地项目状态和已批准文档。

## Recommended Workflow / 推荐工作流

1. Define the task with `task-template.md`. / 使用 `task-template.md` 定义任务。
2. Let ChatGPT review goals, scope, risks, and verification criteria. / 由 ChatGPT 审查目标、范围、风险和验证标准。
3. Let Codex inspect, plan, execute locally, verify, and report with `result-template.md`. / 由 Codex 在本地检查、计划、执行、验证，并使用 `result-template.md` 报告。
4. Evaluate the result with `review-template.md`. / 使用 `review-template.md` 评估结果。
5. Commit only after review; back up only at a stable milestone. / 仅在审查后提交；仅在稳定里程碑备份。

## Safety Boundaries / 安全边界

Work stays inside the approved workspace and file scope. High-risk actions require explicit human confirmation. Do not expose secrets, private memory, backups, logs, credentials, account data, or private paths. See `safety-policy.md`.

工作必须限制在已批准的工作区和文件范围内。高风险操作需要人工明确确认。不得暴露密钥、私人记忆、备份、日志、凭据、账户数据或私人路径。详见 `safety-policy.md`。

## Cost Boundaries / 成本边界

Default to zero extra cost. Do not enable API billing, automatic loops, background agents, or token-heavy scans without explicit approval and a documented need. Prefer small, scoped tasks. See `cost-policy.md`.

默认保持零额外成本。未经明确批准和必要性记录，不启用 API 计费、自动循环、后台智能体或高 Token 消耗扫描。优先使用小型、范围明确的任务。详见 `cost-policy.md`。

## Future Upgrade Path / 未来升级路径

A future full agent-to-agent layer may add machine-readable task schemas, authenticated local queues, approval gates, audit logs, controlled API adapters, cost budgets, and failure recovery. Introduce each capability separately, review privacy and cost, and keep it disabled until explicitly approved.

未来的完整智能体间协作层可逐步加入机器可读任务结构、经过认证的本地队列、审批门、安全审计日志、受控 API 适配器、成本预算和失败恢复。每项能力都应单独引入并接受隐私与成本审查，在明确批准前保持关闭。

## Keywords / 关键词

`agent bridge` · `agent-to-agent lite` · `Codex workflow` · `local-first AI workspace` · `AI memory system` · `zero API cost` · `solo AI company`
