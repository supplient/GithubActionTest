# 创建输出目录以免不存在，-R是为了在目录已存在时也不会报错
mkdir -p ./html

# 拷贝资源文件 # TODO: .md文件其实可以不用拷贝
echo "Copying files ......"
cp -R ./md/* ./html

# 生成目录文件
echo "Generating index.md ......"
sh ./make_index.sh ./md

# markdown=>html
echo "Converting markdown to html: ./md =>./html ......"
sh ./convert.sh