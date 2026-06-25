# Self-Loop Controller / 自循环控制器

## Purpose
Enable automatic correction cycle in Agent Mesh system.

---

## LOOP FLOW

1. Reviewer detects issue
2. Write feedback message:
   → agent_mesh/a2a/runtime/message_queue.md

3. Planner reads feedback
4. Planner generates new task
5. Executor applies fix
6. Reviewer validates again
7. Repeat if needed

---

## RULES

- No manual intervention required in loop
- All actions must pass through message_queue
- Memory must record each iteration

---

## MODE

SELF-HEALING ACTIVE (SIMULATED)
