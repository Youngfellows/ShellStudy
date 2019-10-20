#!/bin/bash
#Here Document 是 Shell 中的一种特殊的重定向方式，用来将输入重定向到一个交互式 Shell 脚本或程序。

:<<!
结尾的delimiter 一定要顶格写，前面不能有任何字符，后面也不能有任何字符，包括空格和 tab 缩进。
开始的delimiter前后的空格会被忽略掉。
!

cat << EOF 
欢迎来到深圳南山区
百度科技集团
www.baidu.com
EOF

#1.Shell 文件包含
:<<!
和其他语言一样，Shell 也可以包含外部脚本。这样可以很方便的封装一些公用的代码作为一个独立的文件。
Shell 文件包含的语法格式如下：
. filename   # 注意点号(.)和文件名中间有一空格
或
source filename
!

#使用 . 号来引用shell12.sh 文件
#. ./shell12.sh

# 或者使用source包含文件代码
source ./shell12.sh

echo "腾讯的网站是: $url"
play
