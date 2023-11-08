FROM ubuntu:23.10

WORKDIR /tmp
################################################################################
# Packages installation setup
################################################################################
# Install wget and other necessary tools
RUN apt update && apt install -y wget software-properties-common
# Add the PPA for the toolchain
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
# Updatte repositories data
RUN apt update
# Add LLVM toolchain
RUN wget https://apt.llvm.org/llvm.sh; \
    chmod u+x llvm.sh; \
    ./llvm.sh 17
# Add GCC
RUN apt -y install gcc-13 g++-13
# Add build system tools
RUN wget https://github.com/Kitware/CMake/releases/download/v3.26.5/cmake-3.26.5-linux-x86_64.sh; \
    chmod +x cmake-3.26.5-linux-x86_64.sh; \
    ./cmake-3.26.5-linux-x86_64.sh --skip-license  --prefix=/usr
RUN apt -y install ninja-build
# Install GDB
RUN apt -y install gdb
