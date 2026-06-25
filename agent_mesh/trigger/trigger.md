# AI OS Trigger Layer / 系统触发层

## Purpose
Enable external activation of Agent OS system.

---

## TRIGGERS

### 1. Manual Trigger
User starts system manually:
→ run Task Generator

---

### 2. Scheduled Trigger (conceptual)
System can be triggered periodically:
→ simulate autonomous execution cycle

---

### 3. Event Trigger
Any change in:
- message_queue.md
- memory state
- task generator output

→ triggers new execution cycle

---

## FLOW

Trigger → Router → Planner → Executor → Reviewer → Memory → Loop

---

## MODE

FULL AUTONOMOUS ARCHITECTURE (SIMULATED)
