require 'socket'

socket = Socket.new(:INET, :STREAM)
remote_addr = Socket.pack_sockaddr_in(80, 'bing.com')

begin
  socket.connect_nonblock(remote_addr)
rescue Errno::EINPROGRESS
  IO.select(nil, [socket])
  
  begin
    socket.connect_nonblock(remote_addr)
  rescue Errno::EISCONN
    # 成功
  rescue Errno::ECONNREFUSED
    # 被远程主机拒绝
  end
end