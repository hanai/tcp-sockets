for_reading = [
  TCPSocket.new('localhost', 4481),
  TCPSocket.new('localhost', 4481),
  TCPSocket.new('localhost', 4481)
]

for_writing = [
  TCPSocket.new('localhost', 4481),
  TCPSocket.new('localhost', 4481),
  TCPSocket.new('localhost', 4481)
]

IO.select(for_reading, for_writing, for_reading)
