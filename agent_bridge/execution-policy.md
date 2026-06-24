# Execution Policy / 执行策略

## Roles / 角色

- ChatGPT = architect and reviewer. / ChatGPT = 架构师与审查者。
- Codex = local executor. / Codex = 本地执行者。
- User = final approver. / 用户 = 最终批准者。
- AI_WORKSPACE = local memory and project state. / AI_WORKSPACE = 本地记忆与项目状态。

## Required Execution Sequence / 必须执行的顺序

1. Always inspect before modifying. / 修改前始终先检查。
2. Define or confirm the plan and approved file scope. / 定义或确认计划与已批准文件范围。
3. Make small, reversible changes within scope. / 在范围内进行小型、可逆的修改。
4. Always verify after modifying. / 修改后始终验证。
5. Always report using the fixed format in `result-template.md`. / 始终使用 `result-template.md` 的固定格式报告。
6. Commit only after review and explicit approval. / 仅在审查并明确批准后提交。
7. Back up only after a stable milestone and according to workspace backup rules. / 仅在稳定里程碑后按工作区规则备份。

Execution must also comply with `AGENTS.md`, `docs/CODEX_RULES.md`, `safety-policy.md`, and `cost-policy.md`. / 执行还必须遵守 `AGENTS.md`、`docs/CODEX_RULES.md`、`safety-policy.md` 和 `cost-policy.md`。
