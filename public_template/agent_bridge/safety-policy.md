# Safety Policy / 安全策略

## Safe defaults / 安全默认值

- No `sudo` by default. / 默认不使用 `sudo`。
- No deletion by default. / 默认不删除文件。
- No system configuration changes by default. / 默认不修改系统配置。
- No network, proxy, VPN, DNS, firewall, scheduler, or shell startup changes by default. / 默认不修改网络、代理、VPN、DNS、防火墙、调度器或 shell 启动配置。
- No secrets, credentials, personal data, or private history in the repository. / 仓库中不得包含秘密、凭据、个人数据或私人历史。
- No API keys by default. / 默认不创建或使用 API 密钥。
- Work only within the explicitly approved scope. / 仅在明确批准的范围内工作。

## Human approval / 人工批准

High-risk actions require explicit human approval before execution. Examples include deletion, system changes, external publishing, paid services, credential use, broad file movement, and actions outside the approved scope. / 高风险操作必须在执行前获得人工明确批准，例如删除、系统修改、外部发布、付费服务、凭据使用、大范围文件移动，以及超出批准范围的操作。

When uncertain, stop and report the risk. / 不确定时，应停止并报告风险。
