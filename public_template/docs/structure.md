# Template Structure / 模板结构

The public template contains only reusable workflow documentation and safe examples. / 公开模板仅包含可复用的工作流文档和安全示例。

## Root files / 根目录文件

- `README.md`: main bilingual introduction and workflow. / 主要双语介绍与工作流。
- `README_PUBLIC.md`: compact public overview. / 简洁的公开版概览。
- `.gitignore`: blocks common private and generated files. / 阻止常见私人文件和生成文件进入 Git。
- `LICENSE`: MIT license for reuse. / 用于复用的 MIT 许可证。
- `structure.txt`: plain-text directory map. / 纯文本目录结构图。

## agent_bridge / Agent 桥接层

Contains task, result, and review templates plus safety, cost, and execution policies. It defines responsibilities for the User, ChatGPT, and Codex without autonomous automation. / 包含任务、结果和审查模板，以及安全、成本和执行策略。它定义用户、ChatGPT 与 Codex 的职责，但不启用自主自动化。

## docs / 文档

Contains beginner guidance, structure documentation, and frequently asked questions. / 包含初学者指南、结构说明和常见问题。

## examples / 示例

Contains generic task and result examples with no private data. / 包含不带私人数据的通用任务和结果示例。

## Intentionally excluded / 明确排除

Private memory, inbox and outbox content, logs, backups, archives, credentials, tokens, machine state, and private operational history are not part of this template. / 私人记忆、inbox 与 outbox 内容、日志、备份、归档、凭据、Token、机器状态和私人运营历史不属于本模板。
