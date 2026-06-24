from pathlib import Path

INPUT = Path.home() / "AI_WORKSPACE/ai_engine/clean/converged_memory.md"
OUTPUT = Path.home() / "AI_WORKSPACE/ai_engine/abstraction/concept_model.md"

def build_concept_model(text: str) -> str:
    lower = text.lower()

    concepts = []

    if "ai os" in lower:
        concepts.append({
            "name": "Personal AI Operating System",
            "meaning": "A personal command center that helps a solo founder capture, organize, reason about, and act on information.",
            "modules": [
                "Memory Layer",
                "Automation Layer",
                "Insight Layer",
                "Execution Layer"
            ],
            "startup_value": "High",
            "mvp": "A local-first AI workspace that records notes, cleans memory, extracts ideas, and produces founder reports."
        })

    if "automation infrastructure" in lower:
        concepts.append({
            "name": "Automation Infrastructure for Individuals",
            "meaning": "A lightweight workflow engine for individuals to automate repeated thinking and operational tasks.",
            "modules": [
                "Trigger Engine",
                "Queue Engine",
                "Batch Processor",
                "Report Generator"
            ],
            "startup_value": "High",
            "mvp": "A simple automation dashboard for personal AI workflows."
        })

    if "personal memory layer" in lower:
        concepts.append({
            "name": "Personal AI Memory Layer",
            "meaning": "An editable long-term memory system that stores raw notes, cleans them, and turns them into useful knowledge.",
            "modules": [
                "Raw Memory",
                "Clean Memory",
                "Converged Memory",
                "Global Memory"
            ],
            "startup_value": "Medium",
            "mvp": "A markdown-based memory system with AI-assisted summarization and retrieval."
        })

    output = "# V4.5 CONCEPT MODEL\n\n"

    for c in concepts:
        output += f"## {c['name']}\n\n"
        output += f"### Meaning\n{c['meaning']}\n\n"

        output += "### Core Modules\n"
        for m in c["modules"]:
            output += f"- {m}\n"

        output += f"\n### Startup Value\n{c['startup_value']}\n\n"
        output += f"### MVP Direction\n{c['mvp']}\n\n"
        output += "---\n\n"

    if not concepts:
        output += "No strong concepts detected yet.\n"

    return output


def main():
    text = INPUT.read_text()
    result = build_concept_model(text)
    OUTPUT.write_text(result)


if __name__ == "__main__":
    main()
