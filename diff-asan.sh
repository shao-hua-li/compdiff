#!/bin/bash
set -e

if [ -z $1 ]; then
    echo "[!] Please pass the build script for your target."
    exit 1
fi

export CC=clang
export CXX=clang++
export CFLAGS="-g -fsanitize=address,undefined -fno-omit-frame-pointer -fno-sanitize-recover=all"
export CXXFLAGS="-g -fsanitize=address,undefined -fno-omit-frame-pointer -fno-sanitize-recover=all"
export LDFLAGS="-g -fsanitize=address,undefined -fno-omit-frame-pointer -fno-sanitize-recover=all"
export DIFF_ID=asan
source $1

