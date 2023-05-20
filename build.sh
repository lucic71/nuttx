#!/bin/sh

HOSTCC=/ssd/llvm-project-master/build/bin/clang ./tools/configure.sh esp32-devkitc:nsh
sed -i '/CONFIG_XTENSA_TOOLCHAIN_XCLANG/c\CONFIG_XTENSA_TOOLCHAIN_XCLANG=y' .config
sed -i '/CONFIG_XTENSA_TOOLCHAIN_ESP/d' .config
PATH=/git/llvm-project-espressif/build/bin:$PATH
V=1 HOSTCC=/ssd/llvm-project-master/build/bin/clang make -j40 download ESPTOOL_PORT=/dev/ttyUSB0 ESPTOOL_BAUD=115200 ESPTOOL_BINDIR=../esp-bins
