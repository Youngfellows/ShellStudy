#!/bin/bash
#1.获取Android源码的根目录
function gettop
{
    local TOPFILE=build/core/envsetup.mk
    # 如果编译环境已经设置了$TOP，就检查$TOP/build/core/envsetup.mk文件是否存在
    if [ -n "$TOP" -a -f "$TOP/$TOPFILE" ] ; then
        # The following circumlocution ensures we remove symlinks from TOP.
        # 转到$TOP目录，通过命令`/bin/pwd`将$TOP目录指向的真实路径存放到PWD中
        #echo "转到\$TOP目录，通过命令将\$TOP目录指向的真实路径存放到PWD中"
        (cd $TOP; PWD= /bin/pwd)
    else
        # 如果当前路径下能够找到build/core/envsetup.mk文件，
        # 则将当前目录的真实路径存放到PWD中
        if [ -f $TOPFILE ] ; then
        	echo "将当前目录的真实路径存放到PWD中,直接打印"
            PWD= /bin/pwd
            #echo "PWD=${PWD}"
        else
            # 如果当前目录下无法找到build/core/envsetup.mk文件，
            # 则不断返回到外层目录查找，直到到达根目录/为止

            # 保存查找操作前的路径
            #echo "保存查找操作前的路径"
            #echo "PWD=${PWD}"
            local HERE=$PWD
            T=
            while [ \( ! \( -f $TOPFILE \) \) -a \( $PWD != "/" \) ]; do
                # 转到外层目录
                \cd ..
                # 将当前路径保存到T中
                T=`PWD= /bin/pwd -P`
                #echo "T=${T}"
            done
            # 查找完后恢复操作前的路径
            \cd $HERE
            # 如果目录T包含build/core/envsetup.mk，说明是T是编译的根目录
            if [ -f "$T/$TOPFILE" ]; then
                # 输出$T中保存的路径作为gettop的返回值
                #echo "输出\$T中保存的路径作为gettop的返回值"
                echo $T
            fi
        fi
    fi
}

#获取Android源码的根目录
gettop

#2.获取envsetup.sh里面的以function开头的函数，并将函数名打印出来
function hmm() {
	#查找编译环境根目录
    local T=$(gettop)
    echo "${T}"
    local A=""
    local i
    #读取build/envsetup.sh文件，并通过sed操作获取其中定义的函数，并进行排序输出，存放到变量$A中
    for i in `cat $T/build/envsetup.sh | sed -n "/^[[:blank:]]*function /s/function \([a-z_]*\).*/\1/p" | sort | uniq`; do
      A="$A $i"
    done
    echo $A
}

#2.获取envsetup.sh里面的以function开头的函数，并将函数名打印出来
#hmm


#最后mmm函数：首先T=$(gettop)获取源码根目录，
#local DASH_ARGS=$(echo "$@" | awk -v RS=" " -v ORS=" " '/^-.*$/') 根据mmm后面的参数获取以空格隔开，以-开头的字符串
#如：mmm -B frameworks/ 则DASH_ARGS = -B

#local DIRS=$(echo "$@" | awk -v RS=" " -v ORS=" " '/^[^-].*$/') 表示根据mmm后面参数获取以空格隔开，不以-开头的字符串。
#如：DIRS=frameworks/base/

#for DIR in $DIRS ; do
#DIR=`echo $DIR | sed -e 's:/$::'` 去掉DIR结尾的/，DIR=frameworks/base

#if [ -f $DIR/Android.mk ] ;then
#TO_CHOP=`(cd -P -- $T && pwd -P) | wc -c | tr -d ' '`
#上面这句命令是：跳到源码根目录，pwd -P打印出来，获取到字符串长度如：/home/admin/androids TO_CHOP就是20

#TO_CHOP=`expr $TO_CHOP + 1`
#START=`PWD= /bin/pwd`
#MFILE=`echo $START | cut -c${TO_CHOP}-`
#这句话命令是：获取当前目录字符串，去掉前面21个字符，如：当前目录为/home/admin/androids，则MFILE=""

#  if [ "$MFILE" = "" ] ; then
#这里进行判断当前目录是否就是源码目录，如果是的话，MFILE为空，所以MFILe=frameworks/base/Android.mk
#     MFILE=$DIR/Android.mk
#  else
#否则：MFILE=$MFILE/frameworks/base/Android.mk

#总之：就是把当前目录的前面源码根目录去了，然后加上后面mmm -B **参数部分相对的目录，最后加上Android.mk就是，最后Android.mk文件的相对路径。
#   MFILE=$MFILE/$DIR/Android.mk
#  fi
# MAKEFILE=$MAKEFILE $MFILE
#else
#done

#ONE_SHOT_MAKEFILE="MAKEFILE" make -C $T $DASH_ARGS all_modules $ARGS
#相当于：make -C /home/admin/android -B all_modules    ONE_SHOT_MAKEFILE=frameworks/base/Android.mk

#3.编译子模块
function mmm()
{
    local T=$(gettop)
    echo "TOP_PATH=${T}"
    #local DRV=$(getdriver $T)
    if [ "$T" ]; then
        local MAKEFILE=
        local MODULES=
        local ARGS=
        local DIR TO_CHOP
        local GET_INSTALL_PATH=
        local DASH_ARGS=$(echo "$@" | awk -v RS=" " -v ORS=" " '/^-.*$/')
        echo "DASH_ARGS=${DASH_ARGS}"
        local DIRS=$(echo "$@" | awk -v RS=" " -v ORS=" " '/^[^-].*$/')
        echo "DIRS=${DIRS}"

        for DIR in $DIRS ; do
            MODULES=`echo $DIR | sed -n -e 's/.*:\(.*$\)/\1/p' | sed 's/,/ /'`
            if [ "$MODULES" = "" ]; then
                MODULES=all_modules
            fi
            echo "DIR=${DIR}"
            DIR=`echo $DIR | sed -e 's/:.*//' -e 's:/$::'`
            echo "DIR=${DIR}"

            if [ -f $DIR/Android.mk ]; then
                local TO_CHOP=`(\cd -P -- $T && pwd -P) | wc -c | tr -d ' '`
                echo "TO_CHOP=${TO_CHOP}"

                local TO_CHOP=`expr $TO_CHOP + 1`
                local START=`PWD= /bin/pwd`
                echo "START=${START}"

                #获取当前目录字符串，去掉前面21个字符
                local MFILE=`echo $START | cut -c${TO_CHOP}-`
                echo "MFILE=${MFILE}"

                #这里进行判断当前目录是否就是源码目录，如果是的话，MFILE为空
                if [ "$MFILE" = "" ] ; then
                    MFILE=$DIR/Android.mk
                    #获取到当前编译模块的Android.mk目录
                    echo "MFILE=${MFILE}"
                else
                    MFILE=$MFILE/$DIR/Android.mk
                fi
                MAKEFILE="$MAKEFILE $MFILE"
                echo "MAKEFILE_PATH=${MAKEFILE}"
            else
                case $DIR in
                  showcommands | snod | dist | incrementaljavac) ARGS="$ARGS $DIR";;
                  GET-INSTALL-PATH) GET_INSTALL_PATH=$DIR;;
                  *) echo "No Android.mk in $DIR."; return 1;;
                esac
            fi
        done
        if [ -n "$GET_INSTALL_PATH" ]; then
          ARGS=$GET_INSTALL_PATH
          MODULES=
        fi

        #正真执行编译
        echo "正真执行编译"
        #ONE_SHOT_MAKEFILE="$MAKEFILE" $DRV make -C $T -f build/core/main.mk $DASH_ARGS $MODULES $ARGS
    else
        echo "Couldn't locate the top of the tree.  Try setting TOP."
    fi
}

#3.调用mmm编译子模块,在当前工程目录下执行
#mmm -B "packages\apps\DeskClock"

#4.查看有多少个function函数
#sed -n "/^[ \t]*function/ s/function \([a-zA-Z0-9_]\w*\).*/\1/p" < build/envsetup.sh |wc -l
#sed -n "/^[[:blank:]]*function /s/function \([a-z_]\w*\).*/\1/p" < build/envsetup.sh | wc -l
#sed -n "s/^[ \t]*function \([a-zA-Z0-9_]\w*\).*/\1/p" < build/envsetup.sh |wc -l


#4.croot命令切换到当前编译环境的根目录
function croot()
{
	#查找当前编译树的根目录
	T=$(gettop)
	if [ "$T" ]; then
		#切换到编译环境的根目录
		echo "切换到编译环境的根目录"
		\cd $(gettop)
	else
		echo "Couldn't locate the top of the tree.  Try setting TOP."
	fi
}


#5.cproj命令用于切换到当前模块的编译目录下（含有Android.mk）
function cproj()
{
    TOPFILE=build/core/envsetup.mk
    # 保存操作前的路径
    local HERE=$PWD
    echo "HERE=${HERE}"
    T=
    # 当前目录下build/core/envsetup.mk不存在（即当前目录不是编译根目录），
    # 并且当前目录不是系统根目录
    while [ \( ! \( -f $TOPFILE \) \) -a \( $PWD != "/" \) ] ; do
    	T=$PWD
    	# 当前$T目录下存在文件Android.mk
        echo "T=${T}"
   		if [ -f "$T/Android.mk" ]; then
   			# 转到$T目录	
   			\cd $T
   			return
   		fi
   		# 转到外层目录
   		\cd ..
    done

    # 恢复操作前的路径
    \cd $HERE
    echo "can't find Android.mk"
}

