FROM ubuntu:22.04
RUN apt-get update && apt-get install -y \
    build-essential gdb make git valgrind \
    python3 python3-pip \
    gcc-multilib g++-multilib libc6-dev-i386 \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /work
CMD ["bash"]
