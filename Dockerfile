FROM ubuntu:22.04

################################################################################
# Packages installation setup
################################################################################
RUN apt update
# Package managers
RUN apt -y install pip
RUN pip install conan
# Buld systems
RUN apt -y install cmake
RUN apt -y install ninja-build
# C/C++ compilers
RUN apt -y install gcc-12
RUN apt -y install g++-12
RUN apt -y install clang-14
# Debuger
RUN apt -y install gdb
