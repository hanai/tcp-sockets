connections = [<TCPSocket>, <TCPSocket>, <TCPSocket>]

loop do
  # 查询 select(2) 哪一个连接可以进行读取
  ready = IO.select(connections)

  readable_connections = ready[0]
  readable_connections.each do |conn|
    data = conn.readpartial(4096)
    process(data)
  end
end