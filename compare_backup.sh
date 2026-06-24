#!/bin/bash

set -euo pipefail

BACKUP_DIR="$HOME/AI_WORKSPACE/backups"
TMP_DIR="/tmp/AI_WORKSPACE_backup_check"

shopt -s nullglob
BACKUPS=("$BACKUP_DIR"/AI_WORKSPACE_v0.1.5_clean_*.tar.gz)
shopt -u nullglob

if (( ${#BACKUPS[@]} == 0 )); then
    echo "Error: no v0.1.5 clean backup found in $BACKUP_DIR." >&2
    exit 1
fi

# Timestamped backup names sort chronologically, so the final match is newest.
LATEST_BACKUP="${BACKUPS[${#BACKUPS[@]} - 1]}"

echo "===== AI_WORKSPACE BACKUP COMPARE ====="
echo
echo "Selected backup: $LATEST_BACKUP"

if [[ "$TMP_DIR" != "/tmp/AI_WORKSPACE_backup_check" ]]; then
    echo "Error: unsafe temporary directory: $TMP_DIR" >&2
    exit 1
fi

rm -rf -- "$TMP_DIR"
mkdir -p -- "$TMP_DIR"

echo
echo "## 1. Extract selected v0.1.5 clean backup"
tar -xzf "$LATEST_BACKUP" -C "$TMP_DIR"

DIFF_FOUND=0

compare_file() {
    local number="$1"
    local name="$2"
    local current_file="$3"
    local backup_file="$4"
    local status

    echo
    echo "## $number. Compare $name"

    if diff -u "$current_file" "$backup_file"; then
        return 0
    else
        status=$?
        if (( status == 1 )); then
            DIFF_FOUND=1
            return 0
        fi

        echo "Error: diff failed for $name." >&2
        return "$status"
    fi
}

compare_file 2 "global_memory.md" \
    "$HOME/AI_WORKSPACE/memory/global/global_memory.md" \
    "$TMP_DIR/AI_WORKSPACE/memory/global/global_memory.md"

compare_file 3 "version.md" \
    "$HOME/AI_WORKSPACE/status/version.md" \
    "$TMP_DIR/AI_WORKSPACE/status/version.md"

compare_file 4 "system_status.md" \
    "$HOME/AI_WORKSPACE/status/system_status.md" \
    "$TMP_DIR/AI_WORKSPACE/status/system_status.md"

compare_file 5 "COMMANDS.md" \
    "$HOME/AI_WORKSPACE/docs/COMMANDS.md" \
    "$TMP_DIR/AI_WORKSPACE/docs/COMMANDS.md"

compare_file 6 "CODEX_RULES.md" \
    "$HOME/AI_WORKSPACE/docs/CODEX_RULES.md" \
    "$TMP_DIR/AI_WORKSPACE/docs/CODEX_RULES.md"

compare_file 7 "AGENTS.md" "$HOME/AI_WORKSPACE/AGENTS.md" "$TMP_DIR/AI_WORKSPACE/AGENTS.md"

echo
echo "===== COMPARE COMPLETE ====="

if (( DIFF_FOUND != 0 )); then
    echo "Differences found between current files and the selected latest backup." >&2
    exit 1
fi

echo "Current files match the selected latest backup."
