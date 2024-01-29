#!/bin/bash

# 从键盘读取一个输入字符
echo -n "请输入一个A～C之间的字符:"
read IN

# case语句
case $IN in
    A)
        echo "输入的是A"
    ;;
    B)
        echo "输入的是B"
    ;;
    C)
        echo "输入的是C"
    ;;
    *)
        echo "输入的是其他字符，$IN"
    ;;
esac
