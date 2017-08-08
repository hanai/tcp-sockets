require 'socket'

server = TCPServer.new(4481)

loop do
  begin
    connection = server.accept_nonblock
    p connection.readpartial(1024 * 16)
  rescue Errno::EAGAIN
    retry
  end
end