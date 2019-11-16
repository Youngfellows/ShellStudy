#!/bin/bash

#1.获取当前路径
function getpath(){
	PWD= /bin/pwd
#	echo "$PWD"
	echo "www.badiu.com"
}

path=$(getpath)
echo "path=${path}"

#2.判断字符串是否为空
ANDROID_SET_JAVA_HOME=www.baidu.com
if [ -n "$ANDROID_SET_JAVA_HOME" ]; then
	echo "ANDROID_SET_JAVA_HOME是空..."
	JAVA_HOME=""
fi

if [ ! "$JAVA_HOME" ]; then
	echo "JAVA_HOME为空..."
else
	echo "JAVA_HOME=${JAVA_HOME}"
fi

#3.获取函数参数
function pez()
{
	"$@"
   	# 获取$@命令的返回值
    	local retval=$?
	if [ $retval -ne 0 ]; then
		echo "获取参数错误"
	else
		echo "获取参数正确,输出绿色"
	fi
}

#4.测试一波
