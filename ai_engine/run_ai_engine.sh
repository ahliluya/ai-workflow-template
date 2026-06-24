#!/bin/bash

echo "===== AI ENGINE RUN START $(date) ====="

bash ~/AI_WORKSPACE/ai_engine/clean/clean.sh

python3 ~/AI_WORKSPACE/ai_engine/clean/semantic_clean.py

python3 ~/AI_WORKSPACE/ai_engine/clean/reasoning.py

python3 ~/AI_WORKSPACE/ai_engine/clean/brain_v44.py

python3 ~/AI_WORKSPACE/ai_engine/clean/convergence.py

python3 ~/AI_WORKSPACE/ai_engine/abstraction/abstraction.py

echo "===== AI ENGINE RUN COMPLETE $(date) ====="
