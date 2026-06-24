from pathlib import Path
import re

RAW_FILE = str(Path.home() / "AI_WORKSPACE/memory/global/global_memory.md")
OUT_FILE = str(Path.home() / "AI_WORKSPACE/ai_engine/clean/v44_brain.md")

def analyze(text):
    t = text.lower()

    # ===== V4.4 SEMANTIC LOGIC =====

    score = 0
    tags = []

    # 系统建设类（高价值）
    if any(k in t for k in ["workspace", "system", "engine"]):
        score += 3
        tags.append("SYSTEM_BUILD")

    # 自动化相关（非常高价值）
    if any(k in t for k in ["cron", "trigger", "queue", "batch"]):
        score += 4
        tags.append("AUTOMATION")

    # 测试类（低价值）
    if "test" in t:
        score -= 3
        tags.append("NOISE")

    # alias / workflow（中高价值）
    if "alias" in t:
        score += 2
        tags.append("WORKFLOW")

    # sync（中性）
    if "sync" in t:
        score += 1
        tags.append("SYNC")

    return score, tags


def extract_ideas(lines):
    ideas = []

    for line in lines:
        l = line.lower()

        # SaaS机会识别（核心升级点）
        if "system" in l and "workspace" in l:
            ideas.append("AI Personal Operating System (AI OS)")
        if "automation" in l or "cron" in l:
            ideas.append("Automation Workflow Engine for Individuals")
        if "memory" in l:
            ideas.append("Personal AI Memory Layer")

    return list(set(ideas))


def run():
    with open(RAW_FILE, "r") as f:
        lines = [l.strip() for l in f.readlines() if l.strip()]

    results = []
    ideas = extract_ideas(lines)

    for line in lines:
        score, tags = analyze(line)
        if score >= 2:
            results.append((line, score, tags))

    with open(OUT_FILE, "w") as f:
        f.write("# V4.4 AI MEMORY BRAIN\n\n")

        f.write("## 🔥 HIGH VALUE MEMORY\n")
        for r in results:
            f.write(f"- [{r[1]}] {r[0]} | {r[2]}\n")

        f.write("\n## 💡 SAAS / STARTUP IDEAS\n")
        for i in ideas:
            f.write(f"- {i}\n")

if __name__ == "__main__":
    run()
