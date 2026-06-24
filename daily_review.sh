#!/bin/bash

echo "===== AI_WORKSPACE DAILY REVIEW ====="
echo ""

echo "## 1. System Status"
cat ~/AI_WORKSPACE/status/system_status.md

echo ""
echo "## 2. Latest Global Memory"
tail -n 30 ~/AI_WORKSPACE/memory/global/global_memory.md

echo ""
echo "## 3. Run AI Engine"
~/AI_WORKSPACE/ai_engine/run_ai_engine.sh

echo ""
echo "## 4. Concept Model"
cat ~/AI_WORKSPACE/ai_engine/abstraction/concept_model.md

echo ""
echo "===== DAILY REVIEW COMPLETE ====="
