# AGENTS.md — AI_WORKSPACE Codex Instructions

## Purpose

This file gives Codex the default project instructions for AI_WORKSPACE.

AI_WORKSPACE is a local-first personal AI memory and backup system.

Current version:

v0.1.5-agents-md-patch

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
