#!/bin/bash

#定义函数
function lunch()
{
	local answer 
	
	#lunch命令是否有参数
	if [ "$1" ] 
	then
		echo "第1个参数是: $1 "
		answer=$1
	else
		echo -n "Which would you like? [aosp_arm-eng] "
		#读入设备输入的
		read answer
	fi

	#执行source shell13.sh ---> lunch 或者 lunch angler
	echo "你选择的分支是: ${answer}"
}

function print_lunch_menu()
{
	local uname=$(uname)
	echo 
	echo "You're building on ${uname}"
}
