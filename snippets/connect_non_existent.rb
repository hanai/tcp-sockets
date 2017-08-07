require 'socket'

socket = Socket.new(:INET, :STREAM)

# 尝试在 Gopher 端口连接 bing.com
remote_addr = Socket.pack_sockaddr_in(70, 'bing.com')
socket.connect(remote_addr)