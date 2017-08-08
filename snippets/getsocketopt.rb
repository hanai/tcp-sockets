require 'socket'

socket = TCPSocket.new('bing.com', 80)

# 获得一个描述套接字类型的 Socket::Option 实例
opt = socket.getsockopt(:SOL_SOCKET, :SO_TYPE)

opt.int == Socket::SOCK_STREAM # => true
opt.int == Socket::SOCK_DGRAM # => false