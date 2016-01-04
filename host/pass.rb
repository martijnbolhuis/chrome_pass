#!/usr/bin/env ruby

require 'json'
require 'chrome_messaging'

PASSWORD_STORE = File.join('~', '.password_store')

while message = receive_message
  next unless message[:command]

  case message[:command]
  when 'list'
    json = `tree -J #{PASSWORD_STORE}`
    passwords = JSON.parse(json)
    send_message(passwords)

  when 'show'
    next unless message[:path]
    `pass show #{message[:path]}`
  end

end
