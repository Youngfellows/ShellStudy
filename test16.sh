#!/bin/bash

#获取当前路径
function getpath(){
	PWD= /bin/pwd
#	echo "$PWD"
	echo "www.badiu.com"
}

path=$(getpath)
echo "path=${path}"
