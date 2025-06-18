#!/bin/bash

echo "!!!!!!!!!!!!!!!!"

# 等待所有节点就绪
until mongosh --host mongo-master:27017 --eval "db.hello()" | grep "ismaster"; do
  sleep 2
done

# 初始化副本集（仅在第一个节点执行）
if [ "$(hostname)" = "mongo-master" ]; then
  mongosh --host mongo-master:27017 --username root --password example --authenticationDatabase admin <<EOF
  rs.initiate({
    _id: "rs0",
    members: [
      { _id: 0, host: "localhost:27017", priority: 2 },
      { _id: 1, host: "localhost:27018", priority: 1 },
      { _id: 2, host: "localhost:27019", priority: 1, votes: 0 }
    ]
  })
  EOF
fi