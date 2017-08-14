require 'socket'

Socket.tcp_server_loop(4481) do |conn|
  # 在带内随同其他普通数据接收紧急数据
  conn.setsockopt :SOCKET, :OOBINLINE, true
  
  # 遇到紧急数据时停止读取
  conn.readpartial(1024) # => 'foo'
  conn.readpartial(1024) # => '!'
end