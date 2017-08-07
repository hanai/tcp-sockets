require 'socket'

socket = Socket.new(:INET, :STREAM)

# 发起到 bing.com 端口 80 的连接
remote_addr = Socket.pack_sockaddr_in(80, 'bing.com')
socket.connect(remote_addr)