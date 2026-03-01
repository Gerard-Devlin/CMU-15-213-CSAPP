[TOC]

---

## **一、基础**

- `image`（镜像）: 一个“只读模板”，里面是 Linux + gcc + gdb + make 等工具
- `container`（容器）: 由镜像“启动出来的运行实例”，相当于一台临时 Linux 小机器
- `volume`（卷）: 数据存储方式。容器删了，卷里的数据还在

常用两种挂载方式：

- `bind mount`（推荐用）: 直接把 Windows 目录映射进容器，比如 `C:\CSAPP -> /work`。优点是在 Windows 编辑器里改代码，容器里立刻可见。
- `named volume`: Docker 管理的数据卷，不直接对应 Windows 文件夹。更适合数据库，不适合作业代码。

---

## **二、搭环境**

在 `C:\CSAPP` 打开 PowerShell，执行：

```powershell
@'
FROM ubuntu:22.04
RUN apt-get update && apt-get install -y \
    build-essential gdb make git valgrind \
    python3 python3-pip \
    gcc-multilib g++-multilib libc6-dev-i386 \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /work
CMD ["bash"]
'@ | Set-Content -Encoding ascii Dockerfile
```

```powershell
docker build -t csapp-env .
```

第一次启动容器（把当前目录挂进去）：

```powershell
docker run --name csapp -it -v "${PWD}:/work" -w /work csapp-env
```

进容器后先验证：

```bash
uname -a
gcc --version
gdb --version
```

---

## **三、作业流程**

启动并进入同一个容器：

```powershell
docker start -ai csapp
```

容器里操作：

```bash
cd /work
ls
make
./程序名
```

退出容器但不删环境：

```bash
exit
```

如果想彻底删除容器（谨慎）：

```powershell
docker rm -f csapp
```

---

## **四、调试流程**

在 lab 目录内：

```bash
cd /work/你的lab目录
make clean
make
```

如果要便于调试，尽量用调试编译参数：

```bash
make CFLAGS="-g -O0"
```

运行：

```bash
./程序名
```

GDB 调试：

```bash
gdb ./程序名
```

> [!TIP]
>
> GDB 常用命令：
>
> - `break main` 在 main 断点
> - `break 文件名.c:行号` 在某行断点
> - `run` 运行
> - `next` 单步不进函数
> - `step` 单步进入函数
> - `continue` 继续到下个断点
> - `print 变量` 打印变量
> - `backtrace` 看调用栈
> - `info locals` 看局部变量
> - `quit` 退出

---

> [!CAUTION]
>
> 把整个项目移到**另一个主机路径**比如移到 `D:\CSAPP`
> 这种原容器的 bind mount 还是指向旧路径，必须重建容器（挂载不能直接改）
>
> 可直接这样做：
>
> ```powershell
> docker rm -f csapp
> cd D:\CSAPP
> docker run --name csapp -it -v "${PWD}:/work" -w /work csapp-env
> ```
>
> 补充检查当前容器挂载到哪：
>
> ```powershell
> docker inspect csapp --format "{{range .Mounts}}{{.Source}} -> {{.Destination}}{{println}}{{end}}"
> ```
