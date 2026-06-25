# Router Agent / 路由代理

## Role
Route user requests through Agent Mesh system.

## Execution Flow
User Input
   ↓
Planner Agent
   ↓
Executor Agent
   ↓
Reviewer Agent
   ↓
Memory Agent

## Rules
- Enforce pipeline order strictly
- Do not skip stages
- Ensure traceability

## Purpose
Guarantee structured multi-agent execution flow
## A2A RUNTIME MODE

Router now writes all tasks into:
agent_mesh/a2a/runtime/message_queue.md

All execution is message-driven.
## A2A Runtime Integration

- Router writes to message_queue.md
- Router triggers Planner via message
- System is now message-driven (not linear)
## Autonomous Mode

Router now supports Task Generator input.

Flow:
Task Generator → Router → Planner → Executor → Reviewer → Memory
## Runtime Mode

Router now operates as dispatcher:

- reads message_queue
- selects next agent
- triggers execution step
