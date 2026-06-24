# AI_WORKSPACE Version

## Version
v0.2.0-agent-bridge-lite

## Date
2026-06-24

## Status
Agent Bridge Lite baseline completed with bilingual, privacy-aware task, result, review, safety, cost, and execution policies.

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
- bilingual README and English-first documentation baseline
- searchable project history, naming guide, and system guide
- GitHub readiness and public-template privacy guidance
- Agent Bridge Lite task, result, and review templates
- Agent Bridge Lite safety, cost, and execution policies
- zero-extra-cost human–ChatGPT–Codex collaboration baseline

## Patch Notes
- Added `agent_bridge/` with seven bilingual, privacy-safe documents.
- Standardized task input, Codex reports, review decisions, execution boundaries, safety rules, and cost rules.
- Kept the bridge local and manual with no OpenAI API automation, API keys, automatic loops, or background agents.
- Added README.md with bilingual overview, commands, safety boundaries, Git privacy notes, and roadmap.
- Added English-first bilingual naming, history, and system documentation.
- Added documentation naming and privacy rules to AGENTS.md and CODEX_RULES.md.
- Documented Git baseline commit 2d459d0 without changing commit history.
- Added and verified AGENTS.md at the project root.
- Codex should now automatically read AGENTS.md when started in ~/AI_WORKSPACE.
- Updated current and future clean-backup naming references to AI_WORKSPACE_v0.1.5_clean.
- Fixed compare_backup.sh to select only the newest matching clean backup.
- Prevented wildcard expansion from passing multiple archives to tar.
- Added CODEX_RULES.md to the comparison set.
- Added non-zero exits for extraction errors and real differences.

## Next Upgrade Direction
Review the Agent Bridge Lite baseline, then commit only after explicit approval. Consider full agent-to-agent capabilities only with separate privacy, safety, and cost review.
