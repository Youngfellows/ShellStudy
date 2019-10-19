#!/bin/bash
name="google"
echo $name
echo ${name}

#1、变量赋值
age=18
echo "age is ${age}"
age=22
echo "age is ${age}"

#2、只读变量
url="www.baidu.com"
readonly url
echo ${url}
#url="www.google.com"

#3、删除变量
address="北京"
echo ${address}
unset address
echo ${address}

#4、字符串
str='this is a string'
echo ${str}
your_name='lili'
str="hello,i know you are \"${your_name}\"!\n"
echo ${str}
#字符串拼接,但引号拼接,双引号拼接
your_name="xiaoming"
greeting="hello,"${your_name}" !"
greeting_1="hello1,${your_name} !"
echo $greeting $greeting_1
greeting_2='hello2,'$your_name' !'
greeting_3='hello3,'${your_name}' !'
echo $greeting_2 ${greeting_3}

#5.获取字符串的长度
str1="www.google.com"
echo ${#str1}

#6.提取子字符串
str2="www.google.com.baidu.com"
echo ${str2:4:9}

#7.查找字符串
str3="i am android !"
echo `expr index "${str3}" dr`

#8.shell中的数组
#定义数组元素
address_array=(北京 上海 深圳 广州 南宁)
city_array=(
大连
丹东
贵阳
武汉
)
city_array[5]=沈阳
city_array[6]=哈尔滨
city_array[9]=厦门

#读取数组元素
echo ${address_array[2]}
echo ${city_array[5]}

#遍历数组元素
echo ${address_array[@]}
echo ${city_array[@]}

#获取数组的长度
length=${#address_array[@]}
echo ${length}
size=${#city_array[@]}
echo "size = ${size}"
#获取数组单个元素的长度
length1=${#address_array[2]}
echo "length1 = ${length1}"

#9.shell中的注释
#这是单行注释

:<<EOF
这是多行注释
这是多行注释
这是多行注释
这是多行注释
这是多行注释
这是多行注释
这是多行注释
这是多行注释
这是多行注释
EOF


:<<!
这是多行注释1
这是多行注释1
这是多行注释1
这是多行注释1
这是多行注释1
这是多行注释1
这是多行注释1
这是多行注释1
这是多行注释1
这是多行注释1
这是多行注释1
这是多行注释1
!
