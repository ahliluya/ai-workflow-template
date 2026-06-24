# Getting Started / 入门指南

This guide shows a simple, reviewable workflow for beginners. / 本指南为初学者介绍一个简单、可审查的工作流。

## 1. Clone or copy the template / 克隆或复制模板

Clone the future public repository, or copy this template into a new project directory. Keep personal data outside the repository. / 克隆未来的公开仓库，或把本模板复制到新的项目目录。个人数据应保存在仓库之外。

## 2. Write a task / 编写任务

Copy `agent_bridge/task-template.md`. State one clear goal, the allowed files, forbidden actions, verification checks, and stop conditions. / 复制 `agent_bridge/task-template.md`，写明一个清晰目标、允许修改的文件、禁止事项、验证检查和停止条件。

## 3. Ask ChatGPT to refine it / 请 ChatGPT 完善任务

Ask ChatGPT to review the goal, scope, risks, and success criteria. Do not provide secrets or private data. / 请 ChatGPT 审查目标、范围、风险和成功标准。不要提供密钥或私人数据。

## 4. Let Codex execute locally / 让 Codex 在本地执行

Give Codex the approved task. Codex should inspect first, state its plan, modify only approved files, verify the result, and use the result template. / 将已批准任务交给 Codex。Codex 应先检查并说明计划，只修改已批准文件，验证结果，并使用结果模板报告。

## 5. Review the result / 审查结果

Use `agent_bridge/review-template.md`. Check scope, sensitive files, verification evidence, risks, and Git status. / 使用 `agent_bridge/review-template.md`，检查范围、敏感文件、验证证据、风险和 Git 状态。

## 6. Commit safely / 安全提交

Review the diff and staged files before committing. Never commit credentials, private memory, logs, backups, or personal data. / 提交前审查差异和暂存文件。绝不要提交凭据、私人记忆、日志、备份或个人数据。
