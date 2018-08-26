
class Enigma

  def initialize
    @character_map = {"a" => 1,
                     "b" => 2,
                     "c" => 3,
                     "d" => 4,
                     "e" => 5,
                     "f" => 6,
                     "g" => 7,
                     "h" => 8,
                     "i" => 9,
                     "j" => 10,
                     "k" => 11,
                     "l" => 12,
                     "m" => 13,
                     "n" => 14,
                     "o" => 15,
                     "p" => 16,
                     "q" => 17,
                     "r" => 18,
                     "s" => 19,
                     "t" => 20,
                     "u" => 21,
                     "v" => 22,
                     "w" => 23,
                     "x" => 24,
                     "y" => 25,
                     "z" => 26,
                     "1" => 27,
                     "2" => 28,
                     "3" => 29,
                     "4" => 30,
                     "5" => 31,
                     "6" => 32,
                     "7" => 33,
                     "8" => 34,
                     "9" => 35,
                     "0" => 36,
                     " " => 37,
                     "." => 38,
                     "," => 39}
  end
  def encrypt(message, key = KeyGenerator.new.random_key, date = Date.today.strftime("%d%m%y"))
    offset_array = Offset.new(key,date).build_offset_array
    position = new_character_position(message,offset_array)
  end

  def decrypt(output, key, date = Date.today.strftime("%d%m%y"))
    offset_array = Offset.new(key,date).build_offset_array
    decrypted_offset_array = decrypt_offset_array(output,offset_array)
    decryption = new_character_position(output,decrypted_offset_array)
  end

  def decrypt_offset_array(output,offset_array)
    length = @character_map.length
    decrypted_offset_array = []
    offset_array.each do |num|
      decrypted_offset_array << @character_map[output[decrypted_offset_array.length]] - num%length
    end
    return decrypted_offset_array
  end
    # final_string = ""
    # for i in 0..(output.length-1) do
    #   new_character_position = @character_map[output[i]] - offset_array[(4+i)%4]
    #   while (new_character_position <= 0)
    #     new_character_position += 39
    #   end
    #   final_string += @character_map.key(new_character_position)
    # end
    # return final_string
  # end

  def new_character_position(message,offset_array)
    final_string = ""
    for i in 0..(message.length-1) do
      new_character_position = @character_map[message[i]] + offset_array[(4+i)%4]
      while (new_character_position >= 40)
        new_character_position -= 39
      end
      final_string += @character_map.key(new_character_position)
    end
    return final_string
  end





end
