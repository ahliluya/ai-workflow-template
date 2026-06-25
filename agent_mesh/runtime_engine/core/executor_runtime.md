# Executor Runtime Engine / 执行引擎

## Role
Execute real file-level operations based on A2A messages.

---

## INPUT SOURCE

agent_mesh/a2a/runtime/message_queue.md

---

## EXECUTION RULE

For each message:

1. Read message_queue
2. Identify TYPE = task
3. Execute action:
   - create file
   - modify file
   - append content
4. Mark message as processed

---

## REAL ACTIONS

Allowed operations:
- create file (touch / write)
- append content
- modify markdown files

---

## OUTPUT

Write execution result back to:

agent_mesh/a2a/runtime/message_queue.md
