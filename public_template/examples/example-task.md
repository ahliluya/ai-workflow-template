# Example Task: Create a Docs Checklist / 示例任务：创建文档清单

## Task name / 任务名称

Create a docs checklist / 创建文档清单

## Goal / 目标

Create a short Markdown checklist that helps contributors review documentation before committing. / 创建一个简短的 Markdown 清单，帮助贡献者在提交前审查文档。

## Scope / 范围

Create one new file named `docs/checklist.md`. Do not change scripts or configuration. / 新建一个名为 `docs/checklist.md` 的文件，不修改脚本或配置。

## Allowed files / 允许修改的文件

- `docs/checklist.md`

## Forbidden actions / 禁止事项

- Do not delete or rename files. / 不删除或重命名文件。
- Do not use network services or paid APIs. / 不使用网络服务或付费 API。
- Do not modify files outside the allowed list. / 不修改允许列表之外的文件。

## Execution steps / 执行步骤

1. Inspect existing documentation conventions. / 检查现有文档规范。
2. Plan a concise bilingual checklist. / 规划简洁的双语清单。
3. Create the approved file. / 创建已批准文件。
4. Check Markdown formatting and Git status. / 检查 Markdown 格式和 Git 状态。
5. Report with the result template. / 使用结果模板报告。

## Verification / 验证标准

- The file exists and contains checklist items. / 文件存在并包含清单项目。
- The content is bilingual and contains no private data. / 内容为双语且不包含私人数据。
- `git diff --check` passes. / `git diff --check` 通过。

## Stop conditions / 停止条件

Stop if the target file already contains unrelated user changes or if the requested scope becomes unclear. / 如果目标文件已有无关用户修改，或任务范围变得不清楚，应停止。
