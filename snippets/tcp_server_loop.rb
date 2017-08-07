require 'socket'

Socket.tcp_server_loop(4481) do |connection|
  p connection.fileno
  connection.close
end