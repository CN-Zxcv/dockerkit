keyfile=./configdb/mongodb.key
rm -i $keyfile
openssl rand -base64 756 > $keyfile
# 文件权限
chmod 400 $keyfile
