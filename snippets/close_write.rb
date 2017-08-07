require 'socket'

server = Socket.new(:INET, :STREAM)

addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')
server.bind(addr)
server.listen(128)
connection, _ = server.accept

# 该连接随后不再需要写入数据，但仍需进行读取
connection.close_write

# 该连接不再需要进行任何读写操作
connection.close_read