require 'socket'

server = TCPServer.new 4481

# 禁用 Nagle 算法。告诉服务器不带延迟，即时发送
server.setsockopt(:IPPROTO_TCP, :TCP_NODELAY, 1)
