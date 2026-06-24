# Agent Bridge Lite / 轻量级 Agent 桥接层

Agent Bridge Lite is a document-based workflow for coordinating a User, ChatGPT, and Codex without autonomous agents or API automation. / Agent Bridge Lite 是一种基于文档的工作流，用于协调用户、ChatGPT 与 Codex，不使用自主智能体或 API 自动化。

## Roles / 角色

- ChatGPT is the architect and reviewer: it clarifies goals, scope, risks, and acceptance criteria. / ChatGPT 是架构师和审查者：明确目标、范围、风险和验收标准。
- Codex is the local executor: it inspects, plans, modifies approved files, verifies, and reports. / Codex 是本地执行者：检查、计划、修改已批准文件、验证并报告。
- The User is the final approver: the User authorizes risk, accepts results, and decides whether to commit. / 用户是最终批准者：授权风险、接受结果并决定是否提交。

## Included files / 包含文件

- `task-template.md`: defines goals, scope, allowed files, checks, and stop conditions. / 定义目标、范围、允许文件、检查和停止条件。
- `result-template.md`: provides a fixed Codex execution report. / 提供固定的 Codex 执行报告。
- `review-template.md`: supports human or ChatGPT review. / 支持用户或 ChatGPT 审查。
- `safety-policy.md`: defines safe defaults and approval requirements. / 定义安全默认值和审批要求。
- `cost-policy.md`: keeps zero extra API cost as the default. / 将零额外 API 成本设为默认值。
- `execution-policy.md`: defines the inspect, modify, verify, report, and review sequence. / 定义检查、修改、验证、报告和审查顺序。

Use these documents as reusable starting points. Adapt only the project-specific scope; keep safety and human approval explicit. / 将这些文档作为可复用起点。只调整项目专属范围，并始终明确安全边界与人工审批。
