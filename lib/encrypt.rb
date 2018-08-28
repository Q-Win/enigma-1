require './lib/enigma'
require './lib/key_generator'
require './lib/offset'
require 'date'


documents = ARGV

message_file = documents[0]
encrypted_file = documents[1]

message = File.new(message_file,'r').read.strip
key = KeyGenerator.new.random_key
date = Date.today.strftime("%d%m%y")
output = Enigma.new.encrypt(message,key)

encrypted = File.new(encrypted_file,'a').write(output)

puts "Created '#{encrypted_file}' with the key #{key} and date #{date}."
