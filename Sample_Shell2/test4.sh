#!/bin/bash

#定义函数
sum()
{
    SUM=`expr $1 + $2` 				#和=参数1+参数2
    echo $SUM						#输出计算结果
}

echo -n "请输入两个数字："

# 读入操作数，输入参数1，参数2
read X Y

# 打印，参数1+参数2 =
echo -n "$X + $Y = "

# 调用函数
sum $X $Y

