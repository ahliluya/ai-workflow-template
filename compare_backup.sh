#!/bin/bash

set -euo pipefail

BACKUP_DIR="$HOME/AI_WORKSPACE/backups"
TMP_DIR="/tmp/AI_WORKSPACE_backup_check"

declare -A BACKUP_COUNTS=()
VERSIONS=()
VERSION_GAPS=()
SINGLE_BACKUP_VERSIONS=()
ARCHIVE_STATUS="not checked"
RECOMMENDATION="safe"

print_risk_report() {
    local version

    echo
    echo "===== RISK REPORT ====="
    echo "- backup count per version:"
    if (( ${#VERSIONS[@]} == 0 )); then
        echo "  none"
    else
        for version in "${VERSIONS[@]}"; do
            echo "  $version: ${BACKUP_COUNTS[$version]}"
        done
    fi

    echo "- missing versions detected:"
    if (( ${#VERSION_GAPS[@]} == 0 )); then
        echo "  none"
    else
        printf "  %s\n" "${VERSION_GAPS[@]}"
    fi

    echo "- integrity status: $ARCHIVE_STATUS"
    echo "- recommendation: $RECOMMENDATION"
}

shopt -s nullglob
BACKUPS=("$BACKUP_DIR"/AI_WORKSPACE_v0.2.0_clean_*.tar.gz)
ALL_BACKUPS=("$BACKUP_DIR"/AI_WORKSPACE_v*_clean_*.tar.gz)
shopt -u nullglob

for backup in "${ALL_BACKUPS[@]}"; do
    filename="${backup##*/}"
    if [[ "$filename" =~ ^AI_WORKSPACE_(v[0-9]+\.[0-9]+\.[0-9]+)_clean_.*\.tar\.gz$ ]]; then
        version="${BASH_REMATCH[1]}"
        current_count="${BACKUP_COUNTS[$version]:-0}"
        BACKUP_COUNTS["$version"]=$((current_count + 1))
    fi
done

if (( ${#BACKUP_COUNTS[@]} > 0 )); then
    mapfile -t VERSIONS < <(printf "%s\n" "${!BACKUP_COUNTS[@]}" | sort -V)
fi

previous_version=""
for version in "${VERSIONS[@]}"; do
    if (( BACKUP_COUNTS["$version"] == 1 )); then
        SINGLE_BACKUP_VERSIONS+=("$version")
        echo "Warning: only one clean backup exists for $version." >&2
    fi

    if [[ -n "$previous_version" ]]; then
        IFS=. read -r previous_major previous_minor previous_patch <<< "${previous_version#v}"
        IFS=. read -r current_major current_minor current_patch <<< "${version#v}"

        if ! (( 10#$current_major == 10#$previous_major &&
                10#$current_minor == 10#$previous_minor &&
                10#$current_patch == 10#$previous_patch + 1 )); then
            VERSION_GAPS+=("$previous_version -> $version")
            echo "Warning: backup version continuity gap: $previous_version -> $version." >&2
        fi
    fi

    previous_version="$version"
done

if (( ${#BACKUPS[@]} == 0 )); then
    echo "Error: no v0.2.0 clean backup found in $BACKUP_DIR." >&2
    ARCHIVE_STATUS="target backup unavailable"
    RECOMMENDATION="unsafe"
    print_risk_report
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
echo "## 1. Extract selected v0.2.0 clean backup"
if tar -xzf "$LATEST_BACKUP" -C "$TMP_DIR"; then
    ARCHIVE_STATUS="selected archive extracted successfully; checksum not evaluated"
else
    ARCHIVE_STATUS="selected archive extraction failed"
    RECOMMENDATION="unsafe"
    print_risk_report
    exit 1
fi

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

compare_file 8 "README.md" \
    "$HOME/AI_WORKSPACE/README.md" \
    "$TMP_DIR/AI_WORKSPACE/README.md"

compare_file 9 "naming-and-docs-style.md" \
    "$HOME/AI_WORKSPACE/docs/naming-and-docs-style.md" \
    "$TMP_DIR/AI_WORKSPACE/docs/naming-and-docs-style.md"

compare_file 10 "project-history.md" \
    "$HOME/AI_WORKSPACE/docs/project-history.md" \
    "$TMP_DIR/AI_WORKSPACE/docs/project-history.md"

compare_file 11 "system-guide.md" \
    "$HOME/AI_WORKSPACE/docs/system-guide.md" \
    "$TMP_DIR/AI_WORKSPACE/docs/system-guide.md"

compare_file 12 "agent_bridge/README.md" \
    "$HOME/AI_WORKSPACE/agent_bridge/README.md" \
    "$TMP_DIR/AI_WORKSPACE/agent_bridge/README.md"

compare_file 13 "agent_bridge/task-template.md" \
    "$HOME/AI_WORKSPACE/agent_bridge/task-template.md" \
    "$TMP_DIR/AI_WORKSPACE/agent_bridge/task-template.md"

compare_file 14 "agent_bridge/result-template.md" \
    "$HOME/AI_WORKSPACE/agent_bridge/result-template.md" \
    "$TMP_DIR/AI_WORKSPACE/agent_bridge/result-template.md"

compare_file 15 "agent_bridge/review-template.md" \
    "$HOME/AI_WORKSPACE/agent_bridge/review-template.md" \
    "$TMP_DIR/AI_WORKSPACE/agent_bridge/review-template.md"

compare_file 16 "agent_bridge/safety-policy.md" \
    "$HOME/AI_WORKSPACE/agent_bridge/safety-policy.md" \
    "$TMP_DIR/AI_WORKSPACE/agent_bridge/safety-policy.md"

compare_file 17 "agent_bridge/cost-policy.md" \
    "$HOME/AI_WORKSPACE/agent_bridge/cost-policy.md" \
    "$TMP_DIR/AI_WORKSPACE/agent_bridge/cost-policy.md"

compare_file 18 "agent_bridge/execution-policy.md" \
    "$HOME/AI_WORKSPACE/agent_bridge/execution-policy.md" \
    "$TMP_DIR/AI_WORKSPACE/agent_bridge/execution-policy.md"

echo
echo "===== COMPARE COMPLETE ====="

if (( DIFF_FOUND != 0 )); then
    ARCHIVE_STATUS="selected archive readable; comparison differences detected"
    RECOMMENDATION="unsafe"
elif (( ${#VERSION_GAPS[@]} > 0 || ${#SINGLE_BACKUP_VERSIONS[@]} > 0 )); then
    ARCHIVE_STATUS="selected archive readable; continuity or redundancy warnings present"
    RECOMMENDATION="caution"
else
    ARCHIVE_STATUS="selected archive readable; comparison completed"
    RECOMMENDATION="safe"
fi

print_risk_report

if (( DIFF_FOUND != 0 )); then
    echo "Differences found between current files and the selected latest backup." >&2
    exit 1
fi

echo "Current files match the selected latest backup."
