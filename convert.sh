# usage: bash convert.sh
# 本文件封装了markdown=>html的转换过程
# 执行后会遍历./md中的所有.md文件，利用pandoc转换为html文件，并输出到./html中。
# ./html下的目录结构会与./md保持一致，不存在的目录则会被新建。

src_root="./md"
dst_root="./html"
title="My Blog"
css_file="https://gist.githubusercontent.com/supplient/1726b3acbfed278f54b66cf11129a43b/raw/62b874d98f72005d18b9b2a05d3be6815959b51b/gh-pandoc.css"

# TODO: If there is space in the filename, for-loop will separete the filename
files=`find "${src_root}" -name "*.md"`
for src_file in $files
do
	rel_path="./${src_file#${src_root}/}"
	file="${src_file##*/}"
	dst_dir="${dst_root}/${rel_path%/*}"
	dst_file="${dst_dir}/${file%.*}.html"

	echo "Processing ${src_file}"
	mkdir -p $dst_dir
	pandoc \
		--mathjax \
		-t html \
		-s \
		--css="$css_file" \
		--metadata title:"$title" \
		-o "$dst_file" \
		"$src_file"
done