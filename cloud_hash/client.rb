require 'socket'

module CloudHash
  class Client
    def initialize(host, port)
      @connection = TCPSocket.new(host, port)
    end

    def get(key)
      request "GET #{key}"
    end

    def set(key, value)
      request "SET #{key} #{value}"
    end

    def request(string)
      msg_length = string.size
      packed_msg_length = [msg_length].pack('i')

      @connection.write(packed_msg_length)
      @connection.write(string)
    end
  end
end

client = CloudHash::Client.new('localhost', 4481)

puts client.set 'prez', 'obama'
puts client.get 'prez'
puts client.get 'vp'