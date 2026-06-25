# Agent Mesh EntryPoint / 系统入口

## System Mode
A2A-enabled Agent Mesh System

## Execution Flow

User Input
   ↓
Router (reads A2A messages)
   ↓
Planner Agent
   ↓
Executor Agent
   ↓
Reviewer Agent
   ↓
Memory Agent
   ↓
A2A Message Bus (state sync)

## Key Rule
All communication MUST pass through A2A protocol layer
