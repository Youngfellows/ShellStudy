#!/bin/bash

# 获取当前目录
PATH=`pwd`

# 获取当前用户
USER=`whoami`

# 打印
echo "当前目录是：${PATH}"
echo "当前的角色是: ${USER}"

# 打印普通字符串
STRING="abcedef123?*.*+1U"
echo STRING:$STRING

