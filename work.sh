# 生成目录文件
echo "Generating index.md ......"
sh ./make_index.sh ./md

# markdown=>html
echo "Converting markdown to html: ./md =>./html ......"
sh ./convert.sh