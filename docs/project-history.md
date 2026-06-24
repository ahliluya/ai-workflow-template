# Project History / 项目历史记录

## Overview / 概览

本文件记录 AI_WORKSPACE 从生产基线到双语 Git 文档基线的版本演进。版本说明关注“改了什么”和“为什么重要”，用于 Git 审查、backup verification 和 public-template preparation。

## v0.1-production-baseline

建立本地优先生产基线：支持 capture、inbox、global memory、同步管线、规则型 AI Engine、daily review、clean backup 与 SHA256 校验。

重要性：把分散的个人 AI 工作步骤整理为可运行、可恢复的 **local-first AI workspace**，形成 AI memory system 的最小完整闭环。

## v0.1.1-incremental-sync-patch

加入增量同步状态，使用 inbox 行号与变化检测只处理新增内容，并通过 queue 去重减少重复任务。

重要性：解决旧内容反复同步的问题，让长期记忆增长更稳定，降低 global memory 中的重复噪声。

## v0.1.2-docs-patch

补充日常命令、系统说明、备份对比与恢复文档，使主要操作可以通过明确的 Ubuntu command guide 复现。

重要性：系统从依赖作者经验转向可以依据文档检查和操作，提高维护性和交接能力。

## v0.1.3-codex-rules-patch

新增 `docs/CODEX_RULES.md`，定义 Codex 的角色、工作目录、风险边界、检查—计划—执行—验证—报告流程，以及 shell 和 Python 语法验证要求。

重要性：Codex workflow 有了本地、可审计的执行规范，减少越界操作，并明确用户保留最终审批权。

## v0.1.4-compare-backup-fix

修复 `compare_backup.sh` 的备份选择和错误处理：只选择最新匹配的 clean backup，避免通配符传入多个归档，并在提取失败或真实差异时返回非零状态。

重要性：backup verification 从仅展示输出升级为可依赖的检查步骤，自动化流程能够正确识别失败和差异。

## v0.1.5-agents-md-patch

在项目根目录新增并验证 `AGENTS.md`，让 Codex 从工作区入口读取项目级角色、安全规则、核心命令和必读规则文件。

重要性：项目指令更接近执行入口，改善 agent-to-agent 交接，并将 ChatGPT、Codex 和用户的职责写成稳定约定。

## Git Baseline Commit 2d459d0

提交 `2d459d0` 的说明为 `Initial safe AI_WORKSPACE v0.1.5 template commit`，是当前 `main` 分支的初始安全 Git baseline。

重要性：它保留 v0.1.5 模板的可追踪起点，为 private GitHub backup、差异审查和公开模板清理提供明确基准，同时不改变现有提交历史。

## v0.1.6-git-baseline-docs-polish

建立 English-first filenames 与 bilingual titles 的文档基线，新增项目 README、命名规范、项目历史和系统说明，并补充 Git privacy 与 public-template rules。

重要性：提高项目可搜索性、可扫描性与 GitHub readiness，为 solo AI company 和后续 agent-to-agent 工作流扩展准备清晰入口。
