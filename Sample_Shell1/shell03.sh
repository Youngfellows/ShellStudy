#!/bin/bash

echo "shell 传递参数实例"
echo "执行的文件名: $0"
echo "第1个参数为: $1"
echo "第2个参数为: $2"
echo "第3个参数为: $3"

echo "参数个数为: $#"
echo "传递的参数作为一个字符串显示: $*"
echo "传递的参数显示: $@"
echo "脚本运行当前进程的ID: $$"
echo "后台运行的最后一个进程的ID号: $!"

echo "--- \$*演示 ---"
for i in "$*"; do
	echo ${i}
done

echo "--- \$@演示 ---"
for i in "$@"; do
	echo ${i}
done
