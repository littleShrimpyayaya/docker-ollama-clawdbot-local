FROM node:22-bullseye

# 1️⃣ 基础依赖

RUN apt update && apt install -y \
    curl \
    wget \
    tar \
    gzip \
    zstd \
    bash \
    ca-certificates \
    git \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://ollama.com/install.sh | sh

# 2️⃣ 安装 Clawdbot 全局 CLI
RUN npm install -g clawdbot@latest

# 3️⃣ 默认工作区
WORKDIR /workspace

# 启动命令
CMD ["ollama", "serve"]
