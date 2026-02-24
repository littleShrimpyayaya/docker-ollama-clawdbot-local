# docker-ollama-openclaw-local
# WARNING: openclaw renamed to OpenClaw
# CLI: Clawdbot -> openclaw
# Mirror/tag: v2026.1.30
# 运行方法未变

🦞 openclaw + Ollama 本地运行环境（Docker 版）

使用 Docker 构建一个完全本地化的 openclaw 运行环境，在容器内运行 Ollama 作为大模型后端，适合私有服务器 / 内网 / 本地开发。

---

## 特性

- openclaw 官方 CLI
- Ollama 本地大模型
- Docker / Docker Compose 一键部署
- openclaw 数据持久化
- 默认不暴露公网端口
- 可选云模型（OpenAI / Anthropic / OpenRouter）

---

## 目录结构

.
├── docker-compose.yml  
├── README.md  
├── openclaw/  
│   └── Dockerfile  
└── workspace/  

---

## 构建说明

Dockerfile 内容：

- 基于 node:22-bullseye
- 安装 curl / git / python / zstd 等基础依赖
- 安装 Ollama
- 安装 openclaw CLI
- 默认启动 ollama serve

---

## 快速开始

### 1. 克隆仓库
git clone https://github.com/littleShrimpyayaya/docker-ollama-openclaw-local

cd docker-ollama-openclaw-local

---

### 2. （可选）设置云模型 API Key
Openai api key:

export OPENAI_API_KEY=sk-xxx  

Anthropic api key:

export ANTHROPIC_API_KEY=sk-xxx  

Openrouter api key:

export OPENROUTER_API_KEY=sk-xxx  

---

### 3. 构建并启动
docker compose up -d --build

---

### 4. 进入容器
docker exec -it openclaw bash

---

### 5. ollama模型
## Ollama 使用

查看模型：
ollama list

拉取模型示例（本地）：

ollama pull gemma:2b  
ollama pull llama3.1  
ollama pull qwen2.5  

或运行云端模型：
登录：

ollama signin （会有链接，在浏览器中打开链接登录你的账号）

ollama run kimi-k2.5:cloud

---

### 6. openclaw 使用
使用 Ollama 启动 openclaw：

ollama launch openclaw （有错误可以忽略）

查看状态：

openclaw status

查看日志：

openclaw logs --follow

---

### 7. 配置openclaw
openclaw onboard --install-daemon

在所有供应商里面应该可以看到ollama，供应商就选择这个，其它的按照正常配置openclaw进行配置

---

### 8. 后端运行openclaw
nohup openclaw gateway --port 18789 --verbose >/tmp/openclaw.log 2>&1 &

---

### 9. Pairing code配置
以Telegram为例，执行：

openclaw pairing approve telegram [code]

这个code就是Telegram上面和bot聊天框得到的Pairing code

---

## 数据持久化

openclaw 数据保存在 Docker volume：

openclaw_data:/root/.openclaw

删除容器不会丢失数据。

---

## 网络与安全

- 默认不暴露任何端口
- 不依赖 Homebrew
- 支持关闭非必要外联：
  openclaw_DISABLE_NONESSENTIAL_TRAFFIC=1

---

## 常见问题

Skills 提示 brew not installed 属于正常现象，Docker/Linux 环境下不建议安装 macOS / Homebrew 类 Skills。

使用小模型（如 gemma:2b）时，建议开启 sandbox 并禁用 web/browser 工具。

---

## 完全清理环境
执行清理脚本： bash clean-docker.sh

或:
# 停止并删除所有 Docker Compose 服务
docker compose down -v

# 删除所有镜像
docker rmi $(docker images -qa) -f

# 删除所有卷
docker volume ls -q | xargs -r docker volume rm -f

# 删除所有构建缓存
docker builder prune -a -f

# 删除未使用的数据和网络
docker system prune -a --volumes -f

# 显示 Docker 当前占用情况
docker system df

---

## 参考

openclaw: https://docs.clawd.bot  
Ollama: https://ollama.com  
Docker: https://docs.docker.com/

