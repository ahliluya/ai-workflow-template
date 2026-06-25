# Trigger Engine / 触发引擎

## Purpose
Control when the autonomous system starts execution cycles.

---

## TRIGGER SOURCES

### 1. Manual Trigger
User starts system manually:
→ run auto_loop

---

### 2. Message Trigger
If message_queue.md contains:
- new TASK
- feedback
- retry request

→ activate execution cycle

---

### 3. State Trigger
If memory detects:
- incomplete task
- failed execution
- pending review

→ restart loop

---

## EXECUTION MODEL

Trigger → Router → Planner → Executor → Reviewer → Memory → Trigger

---

## MODE

EVENT-DRIVEN AUTONOMOUS SYSTEM (SIMULATION)
