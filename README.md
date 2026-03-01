# 🧠💻CSAPP Labs Workspace

This repository contains local work for the CMU **Computer Systems: A Programmer's Perspective (CSAPP)** labs.
Each lab is organized in its own directory and can be built and tested independently.

## 📌Overview

The goal of this workspace is to provide a single place to:

- Keep all CSAPP lab code and notes
- Build and debug labs in a consistent environment
- Track progress across assignments

## 🗂️Repo Layout

```
📁 project-root
├─ 📁 datalab/        - Data Lab
├─ 📁 bomb/           - Bomb Lab
├─ 📁 attacklab/      - Attack Lab
├─ 📁 cachelab/       - Cache Lab
├─ 📁 malloclab/      - Malloc Lab
├─ 📁 proxylab/       - Proxy Lab
├─ 📁 archlab/        - Architecture Lab
├─ 📁 perflab/        - Performance Lab
├─ 📁 buflab/         - Buffer Lab
├─ 📁 shlab/          - Shell Lab
├─ 📄 Lab-Instruction.md  - personal notes / instructions
└─ 🐋 Dockerfile           - optional containerized development environment
```

## ✅Prerequisites

Recommended tools:

- Linux environment (native, WSL, or Docker)
- `gcc` / `g++`
- `make`
- `gdb`
- `valgrind` (for memory debugging labs)

## 🚀Quick Start

Setting up docker on Windows.

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

```powershell
docker run --name csapp -it -v "${PWD}:/work" -w /work csapp-env
```

## 🛠️Working on Labs

- Read each lab handout before editing code.
- Start with correctness, then optimize if required by the lab.
- Use `gdb` and `valgrind` early when debugging.
- Keep changes small and test frequently.

## ⚠️Notes

This repository is for study and coursework practice.
Follow your course's academic integrity policy when using or sharing solutions.
