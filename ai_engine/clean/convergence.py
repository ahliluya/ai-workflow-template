from pathlib import Path
import re
from collections import defaultdict

RAW = str(Path.home() / "AI_WORKSPACE/memory/global/global_memory.md")
OUT = str(Path.home() / "AI_WORKSPACE/ai_engine/clean/converged_memory.md")

def normalize(line):
    l = line.lower()

    # ===== 更强语义压缩 =====
    if "sync" in l:
        return "SYSTEM_EVOLUTION"
    if "cron" in l or "trigger" in l or "queue" in l or "batch" in l:
        return "AUTOMATION_CORE"
    if "workspace" in l or "system" in l:
        return "SYSTEM_CORE"

    # 强化 noise（V4.4.2关键）
    if any(k in l for k in ["test", "alias", "init", "success", "initialized"]):
        return "NOISE"

    return "OTHER"


def compress_system_evolution(lines):
    count = sum(1 for l in lines if "sync" in l.lower())

    if count > 3:
        return f"Continuous system evolution pattern detected ({count} events)"
    return "Low-frequency system evolution"


def score_idea(i):
    if "ai os" in i.lower():
        return "HIGH"
    if "automation" in i.lower():
        return "HIGH"
    if "memory" in i.lower():
        return "MID"
    return "LOW"


def run():
    with open(RAW, "r") as f:
        lines = [l.strip() for l in f.readlines() if l.strip()]

    buckets = defaultdict(list)

    seen = set()

    for line in lines:
        cat = normalize(line)
        key = (cat, line)

        if key not in seen:
            buckets[cat].append(line)
            seen.add(key)

    with open(OUT, "w") as f:
        f.write("# V4.4.2 CONVERGED MEMORY\n\n")

        # SYSTEM EVOLUTION（压缩输出）
        f.write("## SYSTEM_EVOLUTION (COMPRESSED)\n")
        f.write(f"- {compress_system_evolution(lines)}\n\n")

        # CORE
        f.write("## SYSTEM_CORE\n")
        for i in buckets.get("SYSTEM_CORE", []):
            f.write(f"- {i}\n")
        f.write("\n")

        # AUTOMATION
        f.write("## AUTOMATION_CORE\n")
        for i in buckets.get("AUTOMATION_CORE", []):
            f.write(f"- {i}\n")
        f.write("\n")

        # NOISE
        f.write("## NOISE\n")
        for i in buckets.get("NOISE", []):
            f.write(f"- {i}\n")
        f.write("\n")

        # SaaS ideas（排序）
        f.write("## CONSOLIDATED SAAS IDEA (RANKED)\n")

        ideas = [
            "AI OS",
            "Automation Infrastructure",
            "Personal Memory Layer"
        ]

        for i in ideas:
            f.write(f"- [{score_idea(i)}] {i}\n")


if __name__ == "__main__":
    run()
