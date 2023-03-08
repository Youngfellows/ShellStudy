#!/bin/bash
#Shell流程控制语句

#1.if else语句
a=22

#a大于0，且a小于100
if [ $a -gt 0 -a $a -le 100 ]
then 
	echo "$a > 0 且 $a < 100"
else
	echo "$a 小于等于0,或者$a 大于等于100"
fi


#2.if elseif else语句
a=32
b=-8

if [ $a == $b ]
then
	echo "a等于b..."
elif  [ $a -gt $b ]
then
	echo "a大于b..."
elif [ $a -lt $b ]
then
	echo "a小于b"
else
	echo "没有符合的条件"
fi

#3.if else语句经常与test命令结合使用
num1=$[2*3]
num2=$[1+5]

if test $[num1] -eq $[num2]
then
	echo "num1等于num2"
else
	echo "num1不等于num2"
fi


#4.for循环
#遍历方式1
city_array=(北京 深圳 南宁 广州 上海 大连 哈尔滨 "中国-乌鲁木齐")
for city in "${city_array[@]}"
do
	echo "${city}"
done

#遍历方式2
for city in "${city_array[*]}"; do
	echo "-->> ${city}"
done

#通常情况下 shell 变量调用需要加 $,但是 for 的 (()) 中不需要
for((i=0;i<=5;i++));do
	echo "这是第${i}次调用..."
done

#5.while语句
num=1
while(( $num<=5 ))
do
	echo "$num"
	#num++
	let "num++"
done

#while循环可用于读取键盘信息
echo "按下 <CTRL-D> 退出"
echo -n "请输入你喜欢的网站名: "
while read FILM
do
	echo "是的! $FILM 是个好网站!"
done

#无限循环
:<<!
while :
do
	echo "无限循环1"
done
!

:<<EOF
while true
do
	echo "无限循环2"
done
EOF

:<<!
for (( ; ; )); do
	echo "无限循环3"
done
!


#6.until 循环
#until 循环执行一系列命令直至条件为 true 时停止。
#until 循环与 while 循环在处理方式上刚好相反。
a=0

#打印0到10
until [ ! $a -le 10 ]
do
	echo "$a"
	a=`expr $a + 1`
done

#7.case选择语句
#Shell case语句为多选择语句。可以用case语句匹配一个值与一个模式，如果匹配成功，执行相匹配的命令
:<<!
取值后面必须为单词in，每一模式必须以右括号结束。取值可以为变量或常数。匹配发现取值符合某一模式后，其间所有命令开始执行直至 ;;。
取值将检测匹配的每一个模式。一旦模式匹配，则执行完匹配模式相应命令后不再继续其他模式。如果无一匹配模式，使用星号 * 捕获该值，再执行后面的命令。
!

echo "输入1 到 4 之间的数字:"
echo "你输入的数字是:"
read iNum
case $iNum in
	1) echo "你选择了1"
	;;
	2) echo "你选择了2"
	;;
	3) echo "你选择了3"
	;;
	4) echo "你选择了4"
	;;
	*) echo "你没有输入1到4之间的数字..."
	;;
esac

#8.跳槽循环
#break命令允许跳出所有循环（终止执行后面的所有循环）。
while :
do
	echo -n "请输入1到5之间的数字:"
	read jNum
	case $jNum in
		1|2|3|4|5) echo "你输入的数字为 ${jNum}!"
		;;
		*) echo "你输入的数字不是1到5之间的,游戏结束"
			#break跳出全部循环
			break
		;; 
	esac
done


#continue命令与break命令类似，只有一点差别，它不会跳出所有循环，仅仅跳出当前循环。
while :
do
	echo -n "请输入1到5之间的数字:"
	read jNum
	case $jNum in
		1|2|3|4|5) echo "你输入的数字为 ${jNum}!"
		;;
		*) echo "-->>你输入的数字${jNum}不是1到5之间的数字..."
			#continue结束本次循环，继续下次循环
			#运行代码发现，当输入大于5的数字时，该例中的循环不会结束，语句 echo "游戏结束" 永远不会被执行。
			continue
			echo "游戏结束...."
		;; 
	esac
done

