# Auto Loop Runtime Controller

## Purpose
Enable controlled continuous execution cycles.

---

## LOOP FLOW

1. Check message_queue.md
2. If TASK exists:
   → Router activates
   → Planner decomposes
   → Executor runs
   → Reviewer validates
   → Memory logs result
3. Reviewer feedback generates new TASK
4. Repeat cycle

---

## LOOP CONDITION

- Loop runs ONLY when TASK exists
- Stop when queue is empty

---

## SAFETY RULE

- No infinite uncontrolled loops
- Each cycle must be logged
