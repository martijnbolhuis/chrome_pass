ef receive_message
  preamble = $stdin.read(4)
  message_length = preamble.unpack('i')[0]

  raw_message = $stdin.read( message_length )
  JSON.parse raw_message
end

# @params message: a hash of the message
def send_message message
  json_message = message.to_json
  preamble = [json_message.length].pack('i')

  $stdout.print preamble
  $stdout.print json_message
  $stdout.flush
end

