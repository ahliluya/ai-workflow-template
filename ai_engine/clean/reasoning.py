from pathlib import Path
import re

RAW_FILE = str(Path.home() / "AI_WORKSPACE/memory/global/global_memory.md")
OUT_FILE = str(Path.home() / "AI_WORKSPACE/ai_engine/clean/reasoned_memory.md")

def score(line):
    line_lower = line.lower()

    # V4.3：语义价值评分（不是关键词分类）
    s = 0

    # 系统行为（中等价值）
    if "sync" in line_lower:
        s += 2

    # 明确测试（低价值）
    if "test" in line_lower:
        s -= 2

    # alias / workflow（高价值）
    if "alias" in line_lower:
        s += 3

    # 结构/系统搭建（高价值）
    if "workspace" in line_lower:
        s += 3

    # 噪音信号
    if "raw memory" in line_lower:
        s -= 3

    return s


def run():
    with open(RAW_FILE, "r") as f:
        lines = f.readlines()

    kept = []
    rejected = []

    for line in lines:
        line = line.strip()
        if not line:
            continue

        s = score(line)

        if s >= 2:
            kept.append((line, s))
        else:
            rejected.append((line, s))

    with open(OUT_FILE, "w") as f:
        f.write("# V4.3 REASONED MEMORY\n\n")

        f.write("## KEPT (valuable)\n")
        for l, s in kept:
            f.write(f"- [{s}] {l}\n")

        f.write("\n## REJECTED (noise)\n")
        for l, s in rejected:
            f.write(f"- [{s}] {l}\n")

if __name__ == "__main__":
    run()
