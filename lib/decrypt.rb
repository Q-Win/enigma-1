require './lib/enigma'
require './lib/key_generator'
require './lib/offset'
require 'date'

documents = ARGV

encrypted.txt = documents[0]
decrypted_file= documents[1]
key = documents[2]
date = documents[3]


encrypt = File.new(encrypted.txt,'r').read.strip
output = Enigma.new.decrypt(encrypt,key,date)

encrypted = File.new(decrypted.txt,'a').write(output)

puts "Created '#{decrypted_file}' with the key #{key} and date #{date}."
