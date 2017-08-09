require 'socket'

socket = Socket.new(:INET, :STREAM)

remote_addr = Socket.pack_sockaddr_in(80, 'bing.com')

begin
  socket.connect_nonblock(remote_addr)
rescue Errno::EINPROGRESS
  # 操作进行中
rescue Errno::EALREADY
  # 之前的非阻塞式连接在进行中
rescue Errno::ECONNREFUSED
  # 远程主机拒绝连接
end