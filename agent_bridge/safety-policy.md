# Safety Policy / 安全策略

## Default Rules / 默认规则

- No `sudo` by default. / 默认不使用 `sudo`。
- No `rm` by default; deletion requires explicit approval and a reviewed target list. / 默认不使用 `rm`；删除需要明确批准并审查目标清单。
- No changes to system directories such as `/etc`, `/usr`, `/bin`, or `/boot`. / 不修改 `/etc`、`/usr`、`/bin` 或 `/boot` 等系统目录。
- No network, proxy, VPN, DNS, or firewall changes. / 不修改网络、代理、VPN、DNS 或防火墙。
- No cron or shell startup changes unless explicitly approved. / 未经明确批准，不修改 cron 或 shell 启动文件。
- No API key creation. / 不创建 API 密钥。
- No secrets, credentials, private keys, or access tokens in the repository. / 仓库中不得包含秘密、凭据、私钥或访问令牌。
- No upload of memory, backups, inbox data, archives, chat logs, or generated private AI memory. / 不上传记忆、备份、inbox 数据、归档、聊天日志或生成的私人 AI 记忆。

## Human Confirmation / 人工确认

High-risk actions require explicit human confirmation before execution. This includes destructive operations, external publishing, credential use, paid API access, system configuration, backup restore, broad data movement, and any action outside the approved scope.

高风险操作在执行前必须获得人工明确确认，包括破坏性操作、外部发布、凭据使用、付费 API 访问、系统配置、备份恢复、大范围数据移动，以及任何超出批准范围的操作。

If risk, scope, or ownership is unclear, stop and report the uncertainty. / 如果风险、范围或所有权不清楚，应停止并报告不确定性。
