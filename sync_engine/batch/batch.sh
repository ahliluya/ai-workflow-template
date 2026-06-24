#!/bin/bash

QUEUE_FILE=~/AI_WORKSPACE/sync_engine/queue/queue.log
GLOBAL_MEMORY=~/AI_WORKSPACE/memory/global/global_memory.md
RAW_INBOX=~/AI_WORKSPACE/inbox
LOG_FILE=~/AI_WORKSPACE/sync_engine/logs/batch.log
STATE_DIR=~/AI_WORKSPACE/sync_engine/state

mkdir -p ~/AI_WORKSPACE/memory/global
mkdir -p ~/AI_WORKSPACE/sync_engine/logs
mkdir -p "$STATE_DIR"

echo "===== BATCH RUN $(date) =====" >> "$LOG_FILE"

if [ ! -s "$QUEUE_FILE" ]; then
    echo "No sync tasks." >> "$LOG_FILE"
    exit 0
fi

TODAY_FILE="$RAW_INBOX/$(date +%Y-%m-%d).md"
LINE_STATE="$STATE_DIR/today_inbox.lines"

if [ ! -f "$TODAY_FILE" ]; then
    echo "No inbox file." >> "$LOG_FILE"
    > "$QUEUE_FILE"
    exit 0
fi

CURRENT_LINES=$(wc -l < "$TODAY_FILE")

if [ -f "$LINE_STATE" ]; then
    LAST_LINES=$(cat "$LINE_STATE")
else
    LAST_LINES=0
fi

NEW_START=$((LAST_LINES + 1))

while IFS="|" read -r TYPE EVENT_TIME REASON
do
    if [ "$TYPE" == "SYNC_REQUEST" ]; then

        if [ "$CURRENT_LINES" -gt "$LAST_LINES" ]; then
            echo "" >> "$GLOBAL_MEMORY"
            echo "## SYNC $EVENT_TIME" >> "$GLOBAL_MEMORY"
            echo "### Reason: $REASON" >> "$GLOBAL_MEMORY"
            echo "### New Memory" >> "$GLOBAL_MEMORY"
            sed -n "${NEW_START},${CURRENT_LINES}p" "$TODAY_FILE" >> "$GLOBAL_MEMORY"
            echo "" >> "$GLOBAL_MEMORY"
        else
            echo "No new lines to sync." >> "$LOG_FILE"
        fi

    fi
done < "$QUEUE_FILE"

echo "$CURRENT_LINES" > "$LINE_STATE"

> "$QUEUE_FILE"

echo "BATCH COMPLETED $(date)" >> "$LOG_FILE"
