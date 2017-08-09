connections = [<TCPSocket>, <TCPSocket>, <TCPSocket>]

loop do
  connections.each do |conn|
    begin
      # 采用非阻塞的方式从每个连接中读取、处理接收到的数据，不然就尝试下一个连接
      data = conn.read_nonblock(4096)
      process(data)
    rescue Errno::EAGAIN
    end
  end
end