# 简介
omo的开发环境镜像，包含一些必须的软件。

# 使用方法
22端口是ssh的端口号
```bash
docker run --restart=always --name=omo-devbox -p 11000:22 -d xtechcloud/omo-devbox
```

启动成功后，进入容器
```bash
docker exec -ti omo-devbox bash
```

更改root密码
```bash
chpasswd
```

# 配置选项
share卷可以映射到windows系统的路径，方便共享文件。
11001-11009的端口号可用以开发使用。
```bash
docker run --restart=always --name=omo-devbox -p /var/omo:/omo -p /var/share:/share -p 11000:22 -p 11001-11009:11001-11009 -p 11001-11009:11001-11009/upd -d xtechcloud/omo-devbox
```
