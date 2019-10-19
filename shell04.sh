#!/bin/bash

#shell中的数组
#1.数组的定义,Shell 数组用括号来表示，元素用"空格"符号分割开

array_address=(北京 南宁 深圳 "中国 香港" "日本东京")
city_array[0]=东莞
city_array[1]=惠州
city_array[2]=珠海

#2.获取数组元素
echo "array_address的第1个元素: ${array_address[0]}"
echo "array_address的第2个元素: ${array_address[1]}"
echo "array_address的第3个元素: ${array_address[2]}"
echo "array_address的第4个元素: ${array_address[3]}"
echo "city_array的第1个元素: ${city_array[0]}"
echo "city_array的第2个元素: ${city_array[1]}"
echo "city_array的第3个元素: ${city_array[2]}"

#3.获取数组中的所有元素,使用@ 或 * 可以获取数组中的所有元素
for i in "${array_address[*]}"; do 
	echo "${i}"
done 

for i in "${city_array[@]}"; do
	echo "${i}"
done 

#4.数组元素的大小
echo "数组大小: ${#array_address[*]}"
echo "数组大小: ${#city_array[@]}"
