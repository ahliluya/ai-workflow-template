# Memory Agent / 记忆代理

## Role
Maintain system execution history and state.

## Stores
- Task history
- Execution logs
- System states
- Version snapshots

## Rules
- Append-only
- No deletion
- No modification of history

## Purpose
Enable long-term traceability of agent execution
## Self-Loop Tracking

Records iteration cycles:
- loop_id
- issue_detected
- fix_applied
- status

Purpose:
Enable system evolution over time
## Autonomous Loop Tracking

Tracks system evolution cycles:

- loop_id
- task_origin (generated / user)
- execution_result
- feedback_status
- next_task_trigger

Purpose:
Enable long-term autonomous behavior simulation
## Auto Loop Capability

System can now:
- detect task existence
- execute full agent cycle
- generate next task via reviewer feedback
- maintain execution history

Mode: CONTROLLED AUTONOMOUS LOOP (SIMULATION)
