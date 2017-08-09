require 'socket'

tcpSocket1 = TCPSocket.new "localhost", 4481
tcpSocket2 = TCPSocket.new "localhost", 4482
tcpSocket3 = TCPSocket.new "localhost", 4483

for_reading = [tcpSocket1, tcpSocket2, tcpSocket3]
for_writing = [tcpSocket1, tcpSocket2, tcpSocket3]

timeout = 10

ready = IO.select(for_reading, for_writing, for_writing, timeout)

p ready