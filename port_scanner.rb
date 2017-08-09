require 'socket'

PORT_RANGE = 1..128
HOST = 'baudu.com'
TIME_TO_WAIT = 5

# 为每个端口创建一个套接字并发起非阻塞式连接
sockets = PORT_RANGE.map do |port|
  socket = Socket.new(:INET, :STREAM)
  remote_addr = Socket.pack_sockaddr_in(port, HOST)

  begin
    socket.connect_nonblock(remote_addr)
  rescue Errno::EINPROGRESS
  end

  socket
end

expiration = Time.now + TIME_TO_WAIT

loop do
  _, writable, _ = IO.select(nil, sockets, nil, expiration - Time.now)
  break unless writable

  writable.each do |socket|
    begin
      socket.connect_nonblock(socket.remote_address)
    rescue Errno::EISCONN
      # 如果套接字已连接，那么就将此视为一次成功
      puts "#{HOST}:#{socket.remote_address.ip_port} accepts connections..."
      sockets.delete(socket)
    rescue Errno::EINVAL
      sockets.delete(socket)
    end
  end
end