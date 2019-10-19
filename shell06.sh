#!/bin/bash
#Shell echo命令

#1.显示普通字符串
echo "my nane is xiao ming!"
echo this is a test string

#2.显示转义字符串
echo "\"I am a cat\""
echo \"I name is xiao hua\"

#3.显示变量
#read 命令从标准设备中读取一行
read name
echo "$name is xxxx"

#4.显示换行
echo -e "OK! \n"
echo "hello shell"

#5.显示不换行
echo -e "OK! \c"
echo "hello shell 2 ..."

#6.显示结果输出到文件
echo "this is a test string,ni shi yi ge da sha bi" > my.log

#7.原样输出字符串，不进行转义或取变量(用单引号)
echo '$name\'

#8.显示命令执行结果,显示时间
echo `date`
