# usage: bash make_index.sh ./md
# 它会递归遍历目录，为每个目录都创建一个index.md
# (index.md) e.g.
# 
# [并行问题_offset2index.html](并行问题_offset2index.html)
# [C++检查模板参数的成员函数是否具有指定签名.html](C++检查模板参数的成员函数是否具有指定签名.html)
# [CUDA中原子锁的实现.html](CUDA中原子锁的实现.html)
# [GPU数据结构设计模式.html](GPU数据结构设计模式.html)
# [PD_reading](PD_reading/index.html)
# [XPBD_reading](XPBD_reading/index.html)


# 创建index文件
indexpath="$1/index.md"
cat /dev/null > $indexpath
# 遍历当前目录下的文件/子目录
for filepath in $1/*
do
	if [ -d $filepath ]
	then
		# 添加 到子目录index文件 的索引
		dirname=${filepath##*/}
		echo "[${dirname}](${dirname}/index.html)" >> $indexpath
		echo "" >> $indexpath
		# 对子目录进行递归操作
		sh ./$0 ${filepath}
	elif [[ ${filepath##*.} == "md" && ${filepath##*/} != "index.md" ]]
	then
		# 对每个非index.md的.md文件建立 到其对应的html文件 的索引项
		filename=${filepath##*/}
		filename="${filename%.*}.html"
		echo "[${filename}]($filename)" >> $indexpath
		echo "" >> $indexpath
	fi
done
