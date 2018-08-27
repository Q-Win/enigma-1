require './lib/enigma'
require './lib/key_generator'
require './lib/offset'
require 'date'
require 'pry'

documents = ARGV

encrypted_file = documents[0]
decrypted_file = documents[1]
key = documents[2]
date = documents[3]

encrypt = File.new(encrypted_file,'r').read.strip
output = Enigma.new.decrypt(encrypt,key,date)

encrypted = File.new(decrypted_file,'a').write(output)

puts "Created '#{decrypted_file}' with the key #{key} and date #{date}."
