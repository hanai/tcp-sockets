require 'socket'
require 'timeout'

timeout = 5

Socket.tcp_server_loop(4481) do |connection|
  begin
    connection.read_nonblock(4096)
  rescue Errno::EAGAIN
    # 监视连接是否可读
    if IO.select([connection], nil, nil, timeout)
      # IO.select 将套接字返回，不返回 nil 就意味着套接字可读
      retry
    else
      raise Timeout::Error
    end
  end

  connection.close
end