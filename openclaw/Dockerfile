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
    build-essential \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# ⭐ 安装新版本 cmake (>=3.29)
RUN wget https://github.com/Kitware/CMake/releases/download/v3.29.6/cmake-3.29.6-linux-x86_64.sh \
    && chmod +x cmake-3.29.6-linux-x86_64.sh \
    && ./cmake-3.29.6-linux-x86_64.sh --skip-license --prefix=/usr/local \
    && rm cmake-3.29.6-linux-x86_64.sh

RUN curl -fsSL https://ollama.com/install.sh | sh

# 2️⃣ 安装 openclaw 全局 CLI
RUN npm install -g openclaw@latest

# 3️⃣ 默认工作区
WORKDIR /workspace

# 启动命令
CMD ["ollama", "serve"]
