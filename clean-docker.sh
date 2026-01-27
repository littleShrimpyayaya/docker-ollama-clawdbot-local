# 文件名：clean-docker.sh
#!/bin/bash

# 🚨 Docker 完整清理脚本
# 注意：会删除所有容器、镜像、卷、构建缓存和未使用的数据
# 使用前请确认你不需要保留任何容器或数据

echo "⚠️  开始清理 Docker 环境，请确认已备份重要数据..."

# 停止并删除所有服务
docker compose down

# 删除所有镜像
docker rmi $(docker images -qa) -f

# 删除所有卷
docker volume ls -q | xargs -r docker volume rm -f

# 删除所有构建缓存
docker builder prune -a -f

# 删除未使用的数据和网络
docker system prune -a --volumes -f

# 显示当前 Docker 占用情况
docker system df

echo "✅ Docker 环境清理完成"
