require 'socket'

Socket.tcp_server_loop(4481) do |connection|
  loop do
    begin
      puts connection.read_nonblock(1024 * 4)
    rescue Errno::EAGAIN
      # EAGAIN: The file was marked for non-blocking I/O, and no data were ready to be read.
      IO.select([connection])
      retry
    rescue EOFError
      break
    end
  end

  connection.close
end