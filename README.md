# docker-ollama-clawdbot-local

🦞 Clawdbot + Ollama 本地运行环境（Docker 版）

使用 Docker 构建一个完全本地化的 Clawdbot 运行环境，在容器内运行 Ollama 作为大模型后端，适合私有服务器 / 内网 / 本地开发。

---

## 特性

- Clawdbot 官方 CLI
- Ollama 本地大模型
- Docker / Docker Compose 一键部署
- Clawdbot 数据持久化
- 默认不暴露公网端口
- 可选云模型（OpenAI / Anthropic / OpenRouter）

---

## 目录结构

.
├── docker-compose.yml  
├── README.md  
├── clawdbot/  
│   └── Dockerfile  
└── workspace/  

---

## 构建说明

Dockerfile 内容：

- 基于 node:22-bullseye
- 安装 curl / git / python / zstd 等基础依赖
- 安装 Ollama
- 安装 Clawdbot CLI
- 默认启动 ollama serve

---

## 快速开始

### 1. 克隆仓库

git clone <your-repo-url>  
cd docker-ollama-clawdbot-local

### 2. （可选）设置云模型 API Key

export OPENAI_API_KEY=sk-xxx  
export ANTHROPIC_API_KEY=sk-xxx  
export OPENROUTER_API_KEY=sk-xxx  

### 3. 构建并启动

docker compose up -d --build

### 4. 进入容器

docker exec -it clawdbot bash

---

## Ollama 使用

查看模型：

ollama list

拉取模型示例：

ollama pull gemma:2b  
ollama pull llama3.1  
ollama pull qwen2.5  

---

## Clawdbot 使用

使用 Ollama 启动 Clawdbot：

ollama launch clawdbot

查看状态：

clawdbot status

查看日志：

clawdbot logs --follow

---

## 数据持久化

Clawdbot 数据保存在 Docker volume：

clawdbot_data:/root/.clawdbot

删除容器不会丢失数据。

---

## 网络与安全

- 默认不暴露任何端口
- 不依赖 Homebrew
- 支持关闭非必要外联：
  CLAWDBOT_DISABLE_NONESSENTIAL_TRAFFIC=1

---

## 常见问题

Skills 提示 brew not installed 属于正常现象，Docker/Linux 环境下不建议安装 macOS / Homebrew 类 Skills。

使用小模型（如 gemma:2b）时，建议开启 sandbox 并禁用 web/browser 工具。

---

## 完全清理环境

docker compose down -v  
docker system prune -a --volumes

---

## 参考

Clawdbot: https://docs.clawd.bot  
Ollama: https://ollama.com  
Docker: https://docs.docker.com/

