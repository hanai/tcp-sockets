require 'socket'

Socket.tcp('bing.com', 80) do |connection|
  connection.write"GET / HTTP/1.1\r\n"
  connection.close
end

# 省略代码块参数
client = Socket.tcp('bing.com', 80)