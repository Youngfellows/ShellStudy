#!/bin/bash
#shell基本运算符号,原生bash不支持简单的数学运算，但是可以通过其他命令来实现，例如 awk 和 expr，expr 最常用。expr 是一款表达式计算工具，使用它能完成表达式的求值操作
#例如，两个数相加(注意使用的是反引号 ` 而不是单引号 ')

#1.算数运算符
a=15
b=45

echo "==算数运算符=="
val=`expr $a + $b`
echo "$a + $b = $val"

val=`expr $a - $b`
echo "$a - $b = $val"

val=`expr $a \* $b`
echo "$a * $b = $val"

val=`expr $b / $a`
echo "$b / $a = $val"

#取余
c=7
d=4
val=`expr $c % $d`
echo "$c % $d = $val"

#相等
if [ $a == $b ] 
then
	echo "a等于b"
fi

#不相等
if [ $a != $b ]
then 
	echo "a不等于b"
fi

#2.关系运算符
#关系运算符只支持数字，不支持字符串，除非字符串的值是数字。
a=23
b=34

echo "========关系运算符==========="
#-eq,检测两个数是否相等，相等返回 true。
if [ $a -eq $b ]
then
	echo "$a -eq $b : a等于b"
else
	echo "$a -eq $b : a不等于b"
fi

#-ne,检测两个数是否不相等，不相等返回 true。
if [ $a -ne $b ]
then
	echo "$a -ne $b : a不等于b,2..."
else
	echo "$a -ne $b : a等于b,2..."
fi

#-gt,检测左边的数是否大于右边的，如果是，则返回 true。
if [ $a -gt $b ]
then
	echo "$a -gt $b : a大于b"
else
	echo "$a -gt $b : a不大于b"
fi

#-lt,检测左边的数是否小于右边的，如果是，则返回 true。
if [ $a -lt $b ]
then
	echo "$a -lt $b : a小于b"
else
	echo "$a -lt $b : a不小于b,3..."
fi

#-ge,检测左边的数是否大于等于右边的，如果是，则返回 true
if [ $a -ge $b ]
then
	echo "$a -ge $b : a大于等于b"
else
	echo "$a -ge $b : a小于b,4..."
fi

#-le,检测左边的数是否小于等于右边的，如果是，则返回 true。
if [ $a -le $b ]
then
	echo "$a -le $b : a小于等于b" 
else
	echo "$a -le $b : a大于b,5...."
fi

#3.布尔运算符
#"!非运算","-o或运算","-a与运算"
echo "=======布尔运算符========"
a=10
b=20

#!非运算
if [ $a != $b ]
then
	echo "$a != $b : a不等于b"
else
	echo "$a != $b: a等于b"
fi

#-0或运算,a小于100 或者 b大于15
if [ $a -lt 100 -o $b -gt 15 ]
then
	echo "$a 小于100 或者 $b 大于15"
else
	echo "$a 大于等于100 且 $b 小于等于15"	
fi

#-a与运算,a大于100,且b小于17
if [ $a -gt 100 -a $b -lt 17 ]
then
	echo "$a 大于100,且 $b 小于17"
else
	echo "$a 小于等于100,或者 $b 大于等于于17"
fi

#3.逻辑运算符
a=22
b=33

#&逻辑与
#a小于100,且b大于30
if [[ $a -lt 100 && $b -gt 30 ]]
then
	echo "$a 小于100,且 $b 大于30,为true..."
else
	echo "$a 小于100,且 $b 大于30,为false..."
fi

#||逻辑或
#a大于30,或者b大于60
if [[ $a -gt 30 || $b -gt 60 ]]
then
	echo "$a 大于30,或者 $b 大于60,为true ..." 
else
	echo "$a 大于30,或者 $b 大于60,为false ..." 
fi


#4.字符串运算符
a="abc"
b="def"

echo "===========字符串运算符==========="
#=检测两个字符串是否相等，相等返回 true。
if [ $a = $b ]
then
	echo "$a = $b : a字符串等于b字符串" 
else
	echo "$a != $b : a字符串不等于b字符串" 
fi

#!=,检测两个字符串是否相等，不相等返回 true。
if [ $a != $b ]
then
	echo "$a != $b : a字符串不等于b字符串" 
else
	echo "$a == $b : a字符串等于b字符串" 
fi

#-z,检测字符串长度是否为0，为0返回 true。
if [ -z $a ]
then
	echo "a字符串的长度为0"
else
	echo "a字符串的长度不为0"
fi

#-n,检测字符串长度是否为0，不为0返回 true。
if [ -n $a ]
then
	echo "a字符串的长度不为0"
else
	echo "a字符串的长度为0"
fi

#$,检测字符串是否为空，不为空返回 true。
if [ $a ]
then
	echo "$a: 字符串不为空..."
else
	echo "$a: 字符串为空..."
fi


#5.文件测试运算符
file="/home/ubuntu/aijie/shell/ShellStudy/shell04.sh"

if [ -r $file ]
then
	echo "文件可读"
else
	echo "文件不可读"
fi

if [ -w $file ]
then
	echo "文件可写"
else
	echo "文件不可写"
fi

if [ -x $file ]
then
	echo "文件可执行" 
else
	echo "文件不可执行"
fi

if [ -f $file ]
then
	echo "文件为普通文件" 
else
	echo "文件为特殊文件"
fi

if [ -d $file ]
then
	echo "文件是个目录" 
else
	echo "文件不是个目录"
fi

if [ -s $file ]
then
	echo "文件不为空"
else 
	echo "文件为空"
fi

if [ -e $file ]
then
	echo "文件存在"
else
	echo "文件不存在"
fi
