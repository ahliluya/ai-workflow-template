# AI_WORKSPACE 系统说明、备份对比与发送给 ChatGPT 指南

## 1. 当前系统版本

当前版本：

v0.1.5-agents-md-patch

当前系统已经具备：

- 本地记忆记录
- 自动同步
- 全局记忆
- 只同步新增内容
- 规则型 AI Engine
- daily review 日常检查
- clean backup 备份
- SHA256 校验
- 恢复说明
- 命令手册
- 可靠的备份对比脚本
- 已添加并验证项目根目录 AGENTS.md
- 在 ~/AI_WORKSPACE 启动 Codex 时，Codex 应自动读取 AGENTS.md

---

## 2. 这个系统是做什么的

AI_WORKSPACE 是一个本地优先的个人 AI 记忆系统。

它的作用是：

1. 把我的想法、决策、问题、项目进展记录到本地；
2. 自动同步到全局记忆文件；
3. 避免重复同步旧内容；
4. 通过 AI Engine 做规则型整理、分类、抽象；
5. 生成 concept model，帮助我沉淀产品方向；
6. 通过 backup 保存稳定版本；
7. 通过 compare_backup 对比当前系统和备份是否一致；
8. 在需要时，把备份或核心文件发送给 ChatGPT，让 ChatGPT 帮我分析、合并、判断差异。

---

## 3. 核心目录结构

主目录：

~/AI_WORKSPACE

核心路径：

### 3.1 原始输入

~/AI_WORKSPACE/inbox/

每天的 capture 内容会写入这里，例如：

~/AI_WORKSPACE/inbox/2026-06-24.md

---

### 3.2 全局记忆

~/AI_WORKSPACE/memory/global/global_memory.md

这是系统最重要的长期记忆文件。

它保存已经同步后的正式记忆。

---

### 3.3 同步系统

~/AI_WORKSPACE/sync_engine/

核心脚本：

~/AI_WORKSPACE/sync_engine/trigger/trigger.sh  
~/AI_WORKSPACE/sync_engine/queue/queue.sh  
~/AI_WORKSPACE/sync_engine/batch/batch.sh  

作用：

- trigger.sh：检测 inbox 是否变化
- queue.sh：去重同步任务
- batch.sh：把新增内容写入 global_memory
- state：保存 hash 和行号状态
- logs：保存运行日志

---

### 3.4 AI Engine

~/AI_WORKSPACE/ai_engine/

核心脚本：

~/AI_WORKSPACE/ai_engine/run_ai_engine.sh

作用：

运行规则型 AI Engine，把 global_memory 处理成：

- clean memory
- semantic memory
- reasoned memory
- converged memory
- concept model

核心输出：

~/AI_WORKSPACE/ai_engine/abstraction/concept_model.md

---

### 3.5 状态文件

~/AI_WORKSPACE/status/system_status.md  
~/AI_WORKSPACE/status/version.md  

作用：

保存当前系统状态和版本号。

---

### 3.6 文档

~/AI_WORKSPACE/docs/COMMANDS.md

作用：

保存日常命令手册。

---

### 3.7 备份

~/AI_WORKSPACE/backups/

当前备份文件：

AI_WORKSPACE_v0.1.5_clean_*.tar.gz

当前校验文件：

AI_WORKSPACE_v0.1.5_clean.sha256

恢复说明：

README_RESTORE.md

---

## 4. 日常使用命令

### 4.1 记录一条记忆

使用：

capture "这里写你的想法、决策、问题、项目进展"

例子：

capture "今天确认 AI_WORKSPACE v0.1.5-agents-md-patch 已经完成，下一阶段准备进入 V5。"

---

### 4.2 查看每日状态

使用：

review

这个命令会显示：

- system_status
- 最新 global_memory
- 运行 AI Engine
- concept_model

---

### 4.3 对比当前系统和备份

使用：

compare_backup

这个命令会对比当前系统和 clean backup 里的核心文件。

它会对比：

- global_memory.md
- version.md
- system_status.md
- COMMANDS.md

如果中间没有出现 diff 内容，说明当前系统和备份一致。

---

## 5. 我怎么对比本地备份记忆

### 5.1 最简单方式

直接运行：

compare_backup

如果输出类似：

===== COMPARE COMPLETE =====
If there is no diff output above, current files match the backup.

并且中间没有出现：

---
+++
@@

说明当前系统和备份一致。

---

### 5.2 如果出现 diff，怎么看

diff 里面通常会有：

--- 当前文件
+++ 备份文件
@@ 差异位置

常见符号：

- 减号开头：当前文件里有，备份文件里没有
+ 加号开头：备份文件里有，当前文件里没有

注意：

diff 的方向取决于脚本里的文件顺序。  
如果不确定，可以把完整 diff 输出贴给 ChatGPT，让 ChatGPT 判断。

---

### 5.3 当前 compare_backup 的逻辑

脚本路径：

~/AI_WORKSPACE/compare_backup.sh

它会：

1. 清空临时检查目录：

/tmp/AI_WORKSPACE_backup_check

2. 只选择并解压最新的 clean backup 到临时目录；

3. 对比 global_memory.md、version.md、system_status.md、COMMANDS.md 和 CODEX_RULES.md；

4. 输出差异；

5. 提取失败或存在真实差异时返回非零状态；

6. 不会修改当前系统。

所以它是安全的检查命令。

---

## 6. 我怎么把备份发送给 ChatGPT

ChatGPT 不能直接读取我的 Ubuntu 本地文件。

所以我需要主动发送以下内容之一：

### 方式一：直接上传 clean backup

上传这个文件：

~/AI_WORKSPACE/backups/AI_WORKSPACE_v0.1.5_clean_*.tar.gz

适合场景：

- 我要让 ChatGPT 看完整系统结构；
- 我要让 ChatGPT 帮我分析备份里的文件；
- 我要让 ChatGPT 判断系统状态；
- 我要迁移、恢复、升级前做检查。

上传方式：

1. 打开 ChatGPT；
2. 点击输入框旁边的上传按钮；
3. 选择文件；
4. 找到：

~/AI_WORKSPACE/backups/

5. 选择：

AI_WORKSPACE_v0.1.5_clean_*.tar.gz

6. 上传后告诉 ChatGPT：

请读取这个 AI_WORKSPACE 备份包，重点检查 global_memory、version、system_status、COMMANDS 和 sync_engine 脚本。

---

### 方式二：只上传核心记忆文件

如果不想上传整个备份包，可以只上传：

~/AI_WORKSPACE/memory/global/global_memory.md  
~/AI_WORKSPACE/status/version.md  
~/AI_WORKSPACE/status/system_status.md  
~/AI_WORKSPACE/docs/COMMANDS.md  

适合场景：

- 只想让 ChatGPT 看当前记忆；
- 只想对比某几份文档；
- 不想上传脚本和完整目录。

---

### 方式三：复制 diff 输出给 ChatGPT

先运行：

compare_backup

如果出现 diff，把完整输出复制给 ChatGPT。

然后问：

请帮我判断这些差异哪些应该保留，哪些是重复，哪些需要合并进 global_memory。

这是最安全、最轻量的方式。

---

## 7. 发送给 ChatGPT 时应该怎么说

可以直接复制下面的话：

我本地有一个 AI_WORKSPACE 系统。  
这是我的备份包或核心文件。  
请你帮我检查：

1. 当前记忆和备份是否一致；
2. 是否有重复记忆；
3. 是否有缺失记忆；
4. 是否有过时状态；
5. 是否需要合并、清理或升级；
6. 不要直接假设，必须基于我上传的文件内容判断。

---

## 8. ChatGPT 能做什么，不能做什么

### ChatGPT 能做

- 读取我上传的文件；
- 分析 global_memory；
- 判断重复、冲突、缺失；
- 帮我设计升级方案；
- 帮我写 shell 脚本；
- 帮我写文档；
- 帮我判断备份是否合理；
- 根据 diff 输出告诉我怎么合并。

---

### ChatGPT 不能直接做

- 不能直接读取我 Ubuntu 本地文件；
- 不能自动访问 ~/AI_WORKSPACE；
- 不能直接运行我电脑上的 compare_backup；
- 不能直接修改我的本地备份；
- 除非我上传文件，否则它看不到本地内容。

所以正确流程是：

Ubuntu 本地执行命令  
→ 把结果或文件发给 ChatGPT  
→ ChatGPT 分析  
→ ChatGPT 给出下一步命令  
→ 我在本地执行

---

## 9. 备份校验方法

进入备份目录：

cd ~/AI_WORKSPACE/backups

验证备份：

sha256sum -c AI_WORKSPACE_v0.1.5_clean.sha256

正确结果应该类似：

AI_WORKSPACE_v0.1.5_clean_2026-06-24_04-53-29.tar.gz: OK

如果不是 OK，不要恢复这个备份。

---

## 10. 恢复方法

恢复前先验证：

cd ~/AI_WORKSPACE/backups
sha256sum -c AI_WORKSPACE_v0.1.5_clean.sha256

通过后，进入 home：

cd ~

如果当前 AI_WORKSPACE 损坏，先改名保存：

mv AI_WORKSPACE AI_WORKSPACE_broken_backup

然后恢复：

tar -xzf ~/AI_WORKSPACE_broken_backup/backups/AI_WORKSPACE_v0.1.5_clean_*.tar.gz -C ~

恢复后检查：

cat ~/AI_WORKSPACE/status/version.md
review

---

## 11. 当前系统的核心命令总结

记录记忆：

capture "内容"

每日查看：

review

对比备份：

compare_backup

查看全局记忆：

cat ~/AI_WORKSPACE/memory/global/global_memory.md

查看版本：

cat ~/AI_WORKSPACE/status/version.md

查看系统状态：

cat ~/AI_WORKSPACE/status/system_status.md

查看备份：

ls -lh ~/AI_WORKSPACE/backups

验证备份：

cd ~/AI_WORKSPACE/backups
sha256sum -c AI_WORKSPACE_v0.1.5_clean.sha256

---

## 12. 什么时候需要发给 ChatGPT

以下情况建议发给 ChatGPT：

1. compare_backup 出现 diff；
2. global_memory 变乱；
3. 不确定哪些记忆该保留；
4. 准备升级 V5；
5. 准备迁移到新电脑；
6. 想让 ChatGPT 检查脚本逻辑；
7. 备份恢复前想确认安全；
8. 想把多窗口、多项目记忆合并；
9. 想把规则型 AI Engine 升级为真正 AI Semantic Engine。

---

## 13. 最推荐的工作流

平时：

capture "今天的重要想法"

每天：

review

升级前：

compare_backup
cd ~/AI_WORKSPACE/backups
sha256sum -c AI_WORKSPACE_v0.1.5_clean.sha256

如果有问题：

把 compare_backup 输出发给 ChatGPT。

如果要完整分析：

上传 clean backup 给 ChatGPT。

---

## 14. 当前系统阶段结论

AI_WORKSPACE v0.1.5-agents-md-patch 已经是一个稳定的本地 AI 记忆系统基础版。

当前重点不是继续堆功能，而是稳定使用几天，观察：

- capture 是否顺手；
- review 是否有用；
- global_memory 是否保持干净；
- compare_backup 是否可靠；
- 备份恢复链路是否清楚。

下一阶段可以进入：

V5：真正 AI Semantic Engine

目标是把现在的规则型 AI Engine 升级成真正的 GPT / Claude / Local LLM 语义处理层。
