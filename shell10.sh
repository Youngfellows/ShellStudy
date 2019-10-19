#!/bin/bash
:<<!
1、可以带function fun() 定义，也可以直接fun() 定义,不带任何参数。
2、参数返回，可以显示加：return 返回，如果不加，将以最后一条命令运行结果，作为返回值。 return后跟数值n(0-255
!

#1.函数定义
function method1(){
	echo "这是method1()函数..."
}

echo "------函数调用开始-----"
method1
echo "------函数调用结束-----"


#2.函数定义
method2(){
	echo "这是method2()函数"
}

method2


#3.函数的返回值
sum(){
	echo "这个函数会对输入的两个数字进行相加..."
	echo "输入第一个数字: "
	read aNum
	echo "输入第二个数字: "
	read bNum
	
	echo "两个数字分别为$aNum 和 $bNum !"
	return $(($aNum+$bNum))
}

#函数返回值在调用该函数后通过 $? 来获得
sum
echo "输入的两个数的和为: sum = $?"


#4.函数参数
functionParam(){
	echo "第1个参数为: $1"
	echo "第3个参数为: $3"
	echo "第10个参数为: $10"
	echo "第10个参数为: ${10}"
	echo "第14个参数为: ${14}"
	echo "参数总数为: $# 个"
	echo "作为一个字符串输出所有的参数: $*"
}

#注意，$10 不能获取第十个参数，获取第十个参数需要${10}。当n>=10时，需要使用${n}来获取参数。
functionParam 1 2 3 4 5 6 7 8 9 34 78 61 94 北京 33

#5.$? 仅对其上一条指令负责，一旦函数返回后其返回值没有立即保存入参数，那么其返回值将不再能通过 $? 获得。
method3(){
	echo "这是方法method3()函数"
	return `expr 3 + 4`
}

method3
echo "method3()函数返回值: $?"


method4(){
	echo "这是method4()方法"
	expr 23 + 18
}

#函数最后一条命令 expr 23 + 18 得到的返回值（$?值）为 0，意思是这个命令没有出错。所有的命令的返回值仅表示其是否出错，而不会有其他有含义的结果。
method4
echo "method4()函数的返回值: $?"

#第二次调用 method3 后，没有立即查看 $? 的值，而是先插入了一条别的 echo 命令，最后再查看 $? 的值得到的是 0，也就是上一条 ech#o 命令的结果，而 method3 的返回值被覆盖了。
method3
echo "第二次调用method3()的结果: "
echo $?



#6.函数与命令的执行结果可以作为条件语句使用。要注意的是，和 C 语言不同，shell 语言中 0 代表 true，0 以外的值代表 false。
echo "hello shell study !" | grep -e hello
echo "shell 中是真: $?"

echo "www.google.com" | grep -e baidu
echo "shell 中为假: $?"

method5(){
	#返回0为真
	return 0
}

method6(){
	#返回非0为假
	return 128
}

if method5
then
	echo "method5()返回0是true"
else
	echo "method5()返回非0为false"
fi


if method6
then
	echo "method6()返回0是true"
else
	echo "method6()返回非0为false"
fi

