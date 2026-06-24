# AI Workflow Template / AI 工作流模板

A bilingual template for scoped tasks, local execution, review, and safe commits. / 一个用于范围明确任务、本地执行、审查和安全提交的双语模板。

## How to use / 使用方法

1. Copy `agent_bridge/task-template.md` and define one task. / 复制 `agent_bridge/task-template.md`，定义一个任务。
2. Clarify scope, checks, and risks. / 明确范围、检查和风险。
3. Execute locally and complete `result-template.md`. / 在本地执行并填写 `result-template.md`。
4. Review with `review-template.md`, inspect the diff, then commit. / 使用 `review-template.md` 审查，检查差异后再提交。

## Minimal workflow / 最小工作流

Task → Plan → Execute → Verify → Review → Commit
任务 → 计划 → 执行 → 验证 → 审查 → 提交

- Keep secrets and personal data out of Git. / 不向 Git 提交密钥和个人数据。
- Require approval for destructive, external, or paid actions. / 破坏性、外部或付费操作必须获得批准。
- Start with `docs/getting-started.md`; see `examples/` for a complete pair. / 从 `docs/getting-started.md` 开始，完整示例见 `examples/`。
