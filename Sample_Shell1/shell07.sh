#!/bin/bash
#Shell print命令
#语法: printf  format-string  [arguments...]

printf "Hello, Hell\n"

#%s %c %d %f都是格式替代符
#%-10s 指一个宽度为10个字符（-表示左对齐，没有则表示右对齐），任何字符都会被显示在10个字符宽的字符内#，如果不足则自动以空格填充，超过也会将内容全部显示出来。
#%-4.2f 指格式化为小数，其中.2指保留2位小数
printf "%-10s %-8s %-4s\n" 姓名 性别 体总kg
printf "%-10s %-8s %-4.2f\n" 杨过 男 66.1234
printf "%-10s %-8s %-4.2f\n" 小龙女 女 50.321
printf "%-10s %-8s %-4.2f\n" 乔峰 男 72.4567
printf "%-10s %-8s %-4.2f\n" 王语嫣 女 48.2343

#format-string为双引号
printf "%d %s\n" 22 "chang an qi che"

#单引号与双引号效果一样
printf '$d %s\n' 33 "ni hao,wo shi xiao li"

#没有引号也可以输出
printf %s zhe shi sheng zheng nan shan ,are you ok!

#格式只指定了一个参数，但多出的参数仍然会按照该格式输出，format-string 被重用
printf %s adb123 def4568
printf "\n%s %s %s\n" beijing shengzheng shanghai wuhang nanling shanya tianjing guangzhou

#如果没有 arguments，那么 %s 用NULL代替，%d 用 0 代替
printf "%s and %d \n"


