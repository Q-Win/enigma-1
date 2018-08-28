require './lib/enigma'
require './lib/key_generator'
require './lib/offset'
require 'date'
require 'pry'


documents = ARGV

encrypted_file = documents[0]
cracked_file = documents[1]
date = documents[2]



encrypted = File.new(encrypted_file,'r').read.strip
crack = Enigma.new.crack(encrypted,260818)

cracked= File.new(cracked_file,'a').write(crack)

puts "Created '#{cracked_file}' with the key #{key} and date #{date}."
