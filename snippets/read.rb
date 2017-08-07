require 'socket'

Socket.tcp_server_loop(4481) do |connection|
  # 从连接中读取数据
  puts connection.read

  # 完成读取后关闭连接，让客户端知道不用再等待数据返回
  connection.close
end