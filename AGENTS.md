# AGENTS.md — AI_WORKSPACE Codex Instructions

## Purpose

This file gives Codex the default project instructions for AI_WORKSPACE.

AI_WORKSPACE is a local-first personal AI memory and backup system.

Current version:

v0.2.0-agent-bridge-lite

## Required First Step

Before doing any task, Codex must read:

~/AI_WORKSPACE/docs/CODEX_RULES.md

Then follow it strictly.

## Roles

- ChatGPT: architect, reviewer, reasoning layer
- Codex: local execution agent
- User: final approver
- AI_WORKSPACE: local memory, sync, review, backup, and comparison system

## Working Directory

Default working directory:

~/AI_WORKSPACE

Codex should operate inside this directory by default.

Do not modify files outside ~/AI_WORKSPACE unless the user explicitly approves a specific file or path.

## Safety Rules

Do not run sudo unless explicitly approved.

Do not delete, overwrite, restore, or move important files without explicit confirmation.

Do not modify system directories such as:

/etc
/usr
/bin
/boot

Do not install packages or run internet scripts unless explicitly approved.

Do not change cron, shell startup files, network, VPN, proxy, DNS, or firewall settings unless explicitly approved.

## Documentation & Naming Rules / 文档与命名规则

- Use English-first filenames.
- Use bilingual titles: English / 中文.
- Keep public-facing docs clear, searchable, and privacy-safe.
- Do not expose private memory, backups, logs, paths, credentials, or account data.

## Required Workflow

For every task:

1. Inspect first
2. Plan before editing
3. Ask before risky actions
4. Execute only the approved scope
5. Verify after changes
6. Report clearly

Use this report format:

- Findings
- Plan
- Changes made
- Verification
- Remaining risks
- Next step

## Agent Bridge Lite Rules / 轻量级 Agent 桥接规则

For structured tasks, Codex should use `agent_bridge/task-template.md` to confirm task input and `agent_bridge/result-template.md` for the final execution report when appropriate.

对于结构化任务，Codex 应在适当情况下使用 `agent_bridge/task-template.md` 确认任务输入，并使用 `agent_bridge/result-template.md` 输出最终执行报告。

Codex must also respect the review, safety, cost, and execution policies in `agent_bridge/`. Agent Bridge Lite does not authorize API usage, background agents, automatic loops, or work outside the approved scope.

Codex 还必须遵守 `agent_bridge/` 中的审查、安全、成本和执行策略。Agent Bridge Lite 不授权使用 API、后台智能体、自动循环或超出批准范围的工作。

## Core Commands

For human terminal use:

capture "内容"
review
compare_backup

For Codex or non-interactive shell use:

~/AI_WORKSPACE/capture.sh "内容"
~/AI_WORKSPACE/daily_review.sh
~/AI_WORKSPACE/compare_backup.sh

## Important Files

Rules:

~/AI_WORKSPACE/docs/CODEX_RULES.md

Version:

~/AI_WORKSPACE/status/version.md

System status:

~/AI_WORKSPACE/status/system_status.md

Global memory:

~/AI_WORKSPACE/memory/global/global_memory.md

Commands guide:

~/AI_WORKSPACE/docs/COMMANDS.md

Backup directory:

~/AI_WORKSPACE/backups

## Backup Rule

Before major changes, create and verify a clean backup.

Current backup naming pattern:

AI_WORKSPACE_v0.1.5_clean_*.tar.gz

Current SHA256 file:

AI_WORKSPACE_v0.1.5_clean.sha256

After major changes, run:

~/AI_WORKSPACE/compare_backup.sh

## Memory Rule

Important completed changes should be recorded using:

~/AI_WORKSPACE/capture.sh "版本记录：..."

Then sync with:

bash ~/AI_WORKSPACE/sync_engine/trigger/trigger.sh
bash ~/AI_WORKSPACE/sync_engine/queue/queue.sh
bash ~/AI_WORKSPACE/sync_engine/batch/batch.sh

## Final Reminder

When in doubt, stop and ask the user before changing anything risky.
