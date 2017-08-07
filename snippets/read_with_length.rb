require 'socket'

one_kb = 1024 # 字节数

Socket.tcp_server_loop(4481) do |connection|
  # 以 1KB 为单位进行读取
  while data = connection.read(one_kb) do
    puts data
  end

  connection.close
end