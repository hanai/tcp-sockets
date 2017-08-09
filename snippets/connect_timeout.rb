require 'socket'
require 'timeout'

socket = Socket.new(:INET, :STREAM)

remote_addr = Socket.pack_sockaddr_in(80, 'bing.com')

timeout = 5

begin
  socket.connect_nonblock(remote_addr)
rescue Errno::EINPROGRESS
  # 表明连接正在进行中
  # 当套接字可读时，意味着连接完成
  if IO.select(nil, [socket], nil, timeout)
    retry
  else
    raise Timeout::Error
  end
rescue Errno::EISCONN
  # 表明连接已顺利完成
end

socket.write("ohai")
socket.close