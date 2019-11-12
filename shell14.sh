#!/bin/bash
#定义函数
add()
{
	local sum
	sum=$(( $1 + $2 ))
	echo "$1 + $2 = $sum"
}

#先执行source shell14.sh
#再执行add 3 4

#自定不补全
function autotab() {
    echo "function autotab called $@"
}
autotab_list=("aa" "bb" "cc" "dd" "123")

#写个函数来生成补全
function _autotab() {
    local cur
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=( $(compgen -W "${autotab_list[*]}" -- ${cur}) )
    return 0
}
complete -F _autotab autotab

#在上述函数中：
#1.COMPREPLY : 该数组控制连按下 TAB 后显示的结果
#2.COMP_WORDS : 该数组包含命令行输入的单词
#3.COMP_CWORD : COMP_WORDS 数组的索引，使用它来区分命令行可以访问的单词位置
#4.compgen : -W 基于 $current_arg 提供可能的补全及其参数 

#例子中，在shell命令行执行命令autotab时，如果命令未输完，按下Tab键就会补全这个命令，而且还会显示或补全一些参数，
#这些都是通过命令complete及函数_autotab完成的，数组autotab_list的各元素扩展为命令的参数。