# Naming & Documentation Style Guide / 命名与文档规范

## Purpose / 目的

本规范统一 AI_WORKSPACE 的文件命名、双语结构、搜索关键词和公开模板边界，使文档容易查找、扫描、维护和安全复用。

## English-first Filenames / 英文优先文件名

- 新增公开文档使用简短、清晰、全小写的 English-first filename。
- 多个单词使用连字符 `-`，扩展名使用 `.md`。
- 文件名表达主题，不加入个人姓名或私人上下文。
- 现有中文文件可以保留；新增干净版本时使用英文文件名，不删除原文件。

## Bilingual Titles / 中英双语标题

- 一级标题和主要章节使用 `English / 中文` 格式。
- 中文是主要解释语言；保留准确的 English keywords、命令、文件名和技术术语。
- 同一概念使用一致译法，避免在不同文档中随意更名。

## Searchable Keywords / 可检索关键词

标题、摘要和相关章节应自然包含搜索词，不堆砌关键词：

- `local-first AI workspace`
- `AI memory system`
- `Codex workflow`
- `agent-to-agent`
- `solo AI company`
- `backup verification`
- `Ubuntu command guide`
- `bilingual documentation`

命令、脚本和路径使用反引号标记，便于全文搜索和视觉扫描。

## File Naming Examples / 文件命名示例

推荐：

- `README.md`
- `system-guide.md`
- `project-history.md`
- `naming-and-docs-style.md`
- `backup-verification.md`
- `ubuntu-command-guide.md`
- `agent-to-agent-workflow.md`

历史兼容方式：保留原中文长文件，同时新增 `system-guide.md` 作为清晰入口。

## What Not to Do / 禁止事项

- 不新增含糊名称，例如 `new.md`、`final-final.md`、`说明2.md`。
- 不暴露个人姓名、邮箱、用户名、真实主目录、账户标识或凭据。
- 不复制私人 memory、inbox、backup、archive 或 chat log 内容作为示例。
- 不把 API key、token、password、private key 或授权 header 写入文档。
- 不使用营销式关键词堆砌。
- 不删除旧文档来实现改名；先建立兼容入口并单独审批迁移方案。

## Public-template Rules / 公开模板规则

- 公开模板只包含通用脚本、目录占位、规则和去标识化示例。
- 发布前同时检查 tracked files、untracked candidates 和 Git history。
- 路径使用 `~/AI_WORKSPACE` 或通用占位符，不使用真实用户绝对路径。
- 账户、邮箱、凭据和私人标识必须替换为明显占位符。
- README 必须明确安全边界、数据所有权和本地优先设计。
- private GitHub backup 与 public template 是两个不同发布目标，必须分别审查。
