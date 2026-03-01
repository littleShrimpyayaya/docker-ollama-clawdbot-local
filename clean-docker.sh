#!/bin/bash

echo "⚠️ 开始清理本项目 Docker Compose 资源..."

# 1️⃣ 停止并删除容器、卷、网络
docker compose down --volumes --remove-orphans

# 2️⃣ 删除本项目构建产生的镜像（仅本地 build 的）
docker compose down --rmi all --remove-orphans

# 3️⃣ 清理构建缓存（可选）
docker builder prune -f

# 4️⃣ 显示当前 Docker 占用情况
docker system df

echo "✅ Docker Compose 清理完成"
