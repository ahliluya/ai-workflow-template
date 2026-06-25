# Ubuntu Workstation Baseline

AI_WORKSPACE standard path:

~/Workspace/AI_WORKSPACE

## Python Toolchain

- Python: 3.12.3
- uv: 0.11.24
- uv path: ~/.local/bin/uv

## Node.js Toolchain

- Node.js: v24.18.0
- npm: 11.16.0
- Source: NodeSource node_24.x
- Status: keep for now; do not downgrade unless compatibility issues appear.

## Docker Toolchain

- Docker Engine: 29.6.0
- Docker Compose: v5.2.0
- Docker Hub pull: verified with hello-world
- Docker permission: user added to docker group
- Network note: Docker daemon uses local proxy when Docker Hub IPv6 timeout occurs.
