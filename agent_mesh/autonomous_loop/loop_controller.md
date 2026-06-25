# Autonomous Loop Controller / 自治循环控制器

## Purpose
Enable continuous self-improving execution loop for Agent Mesh system.

---

## LOOP FLOW

1. Task Generator creates new task
2. Router dispatches task
3. Planner breaks task into steps
4. Executor performs actions
5. Reviewer validates result
6. Memory records state
7. Reviewer feedback triggers new task

---

## LOOP RULE

- Loop must always pass through all agents
- No direct skipping allowed
- Each iteration must be logged in Memory

---

## MODE

AUTONOMOUS LOOP ACTIVE (SIMULATED)
