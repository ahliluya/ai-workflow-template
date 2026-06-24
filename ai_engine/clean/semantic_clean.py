from pathlib import Path
import re
from collections import defaultdict

RAW_PATH = str(Path.home() / "AI_WORKSPACE/memory/global/global_memory.md")
OUT_PATH = str(Path.home() / "AI_WORKSPACE/ai_engine/clean/semantic_memory.md")

def classify(line):
    line_lower = line.lower()

    if "sync" in line_lower:
        return "system"
    if "test" in line_lower or "alias" in line_lower:
        return "noise"
    if "capture" in line_lower:
        return "action"
    return "info"

def extract():
    with open(RAW_PATH, "r") as f:
        lines = f.readlines()

    buckets = defaultdict(set)

    for line in lines:
        line = line.strip()
        if not line:
            continue

        cat = classify(line)
        buckets[cat].add(line)

    with open(OUT_PATH, "w") as f:
        f.write("# V4.2 SEMANTIC CLEAN MEMORY\n\n")

        for k, v in buckets.items():
            f.write(f"## {k.upper()}\n")
            for item in sorted(v):
                f.write(f"- {item}\n")
            f.write("\n")

if __name__ == "__main__":
    extract()
