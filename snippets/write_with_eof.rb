require 'socket'

client = TCPSocket.new('localhost', 4481)

client.write('test')
client.close