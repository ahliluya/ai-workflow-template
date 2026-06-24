#!/bin/bash

RAW_FILE=~/AI_WORKSPACE/memory/global/global_memory.md
CLEAN_FILE=~/AI_WORKSPACE/ai_engine/clean/clean_memory.md

mkdir -p ~/AI_WORKSPACE/ai_engine/clean

echo "# CLEAN MEMORY V4.1 $(date)" > $CLEAN_FILE
echo "" >> $CLEAN_FILE

# ===== V4.1 CLEAN ENGINE =====

awk '
BEGIN {
    seen[""] = 1;
}

/SYNC/ { next }                 # 去掉SYNC噪音
/Raw Memory/ { next }           # 去掉结构噪音
/BATCH/ { next }                # 去掉系统日志
/TEST/ { next }                 # 去掉测试类（基础过滤）

{
    line = $0;

    # 简单去重（避免重复行）
    if (!(line in seen)) {
        print line;
        seen[line] = 1;
    }
}
' "$RAW_FILE" >> "$CLEAN_FILE"

echo "" >> $CLEAN_FILE
echo "CLEAN COMPLETED V4.1" >> $CLEAN_FILE
