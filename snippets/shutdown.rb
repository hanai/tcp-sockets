require 'socket'

server = Socket.new(:INET, :STREAM)

addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')
server.bind(addr)
server.listen(128)
connection, _ = server.accept

# 创建连接副本
copy = connection.dup

# 关闭所有连接副本上的通信
connection.shutdown

# 关闭原始连接。副本会在垃圾收集器进行收集时关闭
connection.close