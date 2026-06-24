#!/bin/bash

QUEUE_DIR=~/AI_WORKSPACE/sync_engine/queue
INBOX=~/AI_WORKSPACE/inbox
STATE_DIR=~/AI_WORKSPACE/sync_engine/state

mkdir -p "$QUEUE_DIR"
mkdir -p "$STATE_DIR"

EVENT_TIME=$(date '+%Y-%m-%d %H:%M:%S')
TODAY_FILE="$INBOX/$(date +%Y-%m-%d).md"
HASH_FILE="$STATE_DIR/today_inbox.sha256"

# 如果今天没有 inbox 文件，直接退出
if [ ! -f "$TODAY_FILE" ]; then
    exit 0
fi

# 如果今天 inbox 文件为空，直接退出
if [ ! -s "$TODAY_FILE" ]; then
    exit 0
fi

# 计算当前 inbox 指纹
CURRENT_HASH=$(sha256sum "$TODAY_FILE" | awk '{print $1}')

# 如果之前没有记录，第一次写入
if [ ! -f "$HASH_FILE" ]; then
    echo "$CURRENT_HASH" > "$HASH_FILE"
    echo "SYNC_REQUEST|$EVENT_TIME|new_inbox_snapshot" >> "$QUEUE_DIR/queue.log"
    exit 0
fi

# 读取上一次指纹
LAST_HASH=$(cat "$HASH_FILE")

# 只有内容变化时才触发同步
if [ "$CURRENT_HASH" != "$LAST_HASH" ]; then
    echo "$CURRENT_HASH" > "$HASH_FILE"
    echo "SYNC_REQUEST|$EVENT_TIME|inbox_changed" >> "$QUEUE_DIR/queue.log"
fi
