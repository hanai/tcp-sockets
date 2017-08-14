require 'socket'

Socket.tcp_server_loop(4481) do |connection|
  # 优先接收紧急数据
  urgent_data = connection.recv(1, Socket::MSG_OOB)

  data = connection.readpartial(1024)
end
