# AI_WORKSPACE Daily Commands

## Current Version

v0.1.5-agents-md-patch

## 1. Capture a memory

capture "这里写你的想法、决策、问题、项目进展"

## 2. Daily review

review

## 3. Compare current system with backup

compare_backup

## 4. View global memory

cat ~/AI_WORKSPACE/memory/global/global_memory.md

## 5. Run AI Engine manually

~/AI_WORKSPACE/ai_engine/run_ai_engine.sh

## 6. View concept model

cat ~/AI_WORKSPACE/ai_engine/abstraction/concept_model.md

## 7. View system status

cat ~/AI_WORKSPACE/status/system_status.md

## 8. View version

cat ~/AI_WORKSPACE/status/version.md

## 9. View backups

ls -lh ~/AI_WORKSPACE/backups

## 10. Verify latest backup

cd ~/AI_WORKSPACE/backups
sha256sum -c AI_WORKSPACE_v0.1.5_clean.sha256

## 11. View Codex rules

cat ~/AI_WORKSPACE/docs/CODEX_RULES.md

## 12. View project instructions

cat ~/AI_WORKSPACE/AGENTS.md

When Codex starts in ~/AI_WORKSPACE, it should automatically read the root AGENTS.md and then follow CODEX_RULES.md.

## Core Commands

- capture "内容"
- review
- compare_backup

## Codex Rule File

~/AI_WORKSPACE/docs/CODEX_RULES.md

## Codex Project Instruction File

~/AI_WORKSPACE/AGENTS.md

AGENTS.md was added and verified for automatic Codex instruction loading.

Desktop copy:

~/Desktop/CODEX_RULES.md
