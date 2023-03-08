#!/bin/bash
#Shell test 命令
#Shell中的 test 命令用于检查某个条件是否成立，它可以进行数值、字符和文件三个方面的测试。

:<<!
数值测试
参数	说明
-eq	等于则为真
-ne	不等于则为真
-gt	大于则为真
-ge	大于等于则为真
-lt	小于则为真
-le	小于等于则为真
!

a=100
b=273

if test $[a] -eq $[b]
then
	echo "a和b两个数相等" 
else 
	echo "a和b两个数不相等"
fi

#1.代码中的 [] 执行基本的算数运算
c=77
d=103

#注意等号两边不能有空格
result=$[a+b]
echo "result = ${result}"

str1="wwwbaiducom"
str2="wwwgooglecom"

if test $[str1] -gt $[str2]
then
	echo "str1字符串大于str2字符串"
else
	echo "str1字符串不大于str2字符串"
fi


#2.使用关系运算符
str3="wwwtencentcom"
str4="wwwmeituancom"
echo "${str3}"
if  [[ $str3 -gt $str4 ]]
then
	echo "str3字符串大于str4字符串"
else
	echo "str3字符串不大于str4字符串"
fi

str4="wwwtencentcom"
if test $str3 = $str4 
then
	echo "str3字符串等于str4"
else
	echo "str3字符串不等于str4"
fi

#3.文件测试
:<<!
参数	说明
-e 文件名	如果文件存在则为真
-r 文件名	如果文件存在且可读则为真
-w 文件名	如果文件存在且可写则为真
-x 文件名	如果文件存在且可执行则为真
-s 文件名	如果文件存在且至少有一个字符则为真
-d 文件名	如果文件存在且为目录则为真
-f 文件名	如果文件存在且为普通文件则为真
-c 文件名	如果文件存在且为字符型特殊文件则为真
-b 文件名	如果文件存在且为块特殊文件则为真
!
#Shell还提供了与( -a )、或( -o )、非( ! )三个逻辑操作符用于将测试条件连接起来，其优先级为："!"最高，"-a"次之，"-o"最低。

file=my.log
if test -e $file -a -x $file
then
	echo "$file 文件存在,且是可执行的"
else
	echo "$file 文件不存在,或是不可执行的"
fi 
