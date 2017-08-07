require 'socket'
one_hundred_kb = 1024 * 100

Socket.tcp_server_loop(4481) do |connection|
  begin
    # 每次读取 100KB 或更少
    while data = connection.readpartial(one_hundred_kb) do
      puts data
    end
  rescue => EOFError
  end
  connection.close
end