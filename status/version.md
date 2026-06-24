# AI_WORKSPACE Version

## Version
v0.1.5-agents-md-patch

## Date
2026-06-24

## Status
Stable baseline completed with reliable latest-backup comparison and strict error handling.

## Core Commands
- capture "内容"
- review
- compare_backup

## Completed Capabilities
- local memory capture
- inbox storage
- checksum-based sync trigger
- queue deduplication
- batch sync to global_memory
- incremental-only sync
- cron auto sync
- clean global baseline
- AI Engine rule-based processing
- concept model generation
- daily review entrypoint
- backup comparison script with newest-backup selection and strict error handling
- clean backup
- SHA256 verification
- restore guide
- commands guide
- desktop system guide document
- Codex execution rules document
- root AGENTS.md project instruction file, verified for automatic Codex loading

## Patch Notes
- Added and verified AGENTS.md at the project root.
- Codex should now automatically read AGENTS.md when started in ~/AI_WORKSPACE.
- Updated current and future clean-backup naming references to AI_WORKSPACE_v0.1.5_clean.
- Fixed compare_backup.sh to select only the newest matching clean backup.
- Prevented wildcard expansion from passing multiple archives to tar.
- Added CODEX_RULES.md to the comparison set.
- Added non-zero exits for extraction errors and real differences.

## Next Upgrade Direction
Create and verify a new AI_WORKSPACE_v0.1.5_clean backup.
