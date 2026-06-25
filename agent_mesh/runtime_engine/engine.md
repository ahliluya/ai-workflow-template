# Runtime Engine / 运行时引擎

## Purpose
Convert Agent Mesh from static design → executable system.

---

## EXECUTION MODEL

Input:
→ message_queue.md

Flow:
1. Read latest message
2. Route to correct agent
3. Execute task (file-level)
4. Write result back to queue
5. Trigger reviewer
6. Update memory

---

## AGENTS BEHAVIOR

Planner:
- converts message → task plan

Executor:
- performs file operations

Reviewer:
- validates result
- may trigger correction loop

Memory:
- logs every execution step

---

## LOOP RULE

If reviewer = FAIL:
→ create new task message
→ restart cycle
