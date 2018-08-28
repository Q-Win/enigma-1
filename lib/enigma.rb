require 'pry'
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
  def encrypt(message, key = KeyGenerator.new.random_key,
              date = Date.today.strftime("%d%m%y"))
    offset_array = Offset.new(key,date).build_offset_array
    encrypted = new_character_position(message,offset_array)
  end

  def decrypt(output, key, date = Date.today.strftime("%d%m%y"))
    offset_array = Offset.new(key,date).build_offset_array
    decryption = new_decrypted_position(output,offset_array)
  end

  def new_decrypted_position(output,offset_array)
    final_string = ""
    for i in 0..(output.length-1) do
      new_character_position = calc_key_decrypt(i,output,offset_array)
      while (new_character_position <= 0)
        new_character_position += 39
      end
      final_string += @character_map.key(new_character_position)
    end
    return final_string
  end

  def new_character_position(message,offset_array)
    final_string = ""
    for i in 0..(message.length-1) do
      new_character_position = calc_key_encrypt(i,message,offset_array)
      while (new_character_position >= 40)
        new_character_position -= 39
      end
      final_string += @character_map.key(new_character_position)
    end
    return final_string
  end

  def calc_key_decrypt(i, string, offset_array)
    @character_map[string[i]] - offset_array[(4+i)%4]
  end

  def calc_key_encrypt(i,string,offset_array)
    @character_map[string[i]] + offset_array[(4+i)%4]
  end

  def crack(encrypted,date = Date.today.strftime("%d%m%y").to_i)
    last_four_encrypted = crack_last_four(encrypted)
    rotation_array = crack_rotation_array(0,last_four_encrypted,date)
    new_character_position = new_decrypted_position(encrypted.reverse,rotation_array)
    new_character_position.reverse
  end

  def crack_last_four(encrypted)
    split = encrypted.split("")
    last_four = split[-4..-1]
  end

  def crack_rotation_array(i,last_four_encrypted,date)
    expected_end = ["n","d",".","."]
    rotation_array = []
    while i < 4
      rotation_array << @character_map[last_four_encrypted[i]] +  @character_map.length - @character_map[expected_end[i]]
      i += 1
    end
    return rotation_array.reverse
  end


  # def crack_new_character_position(encrypted,rotation_array)
    # reverse_encrypted = encrypted.reverse
    # final_string = ""
    # for i in 0..(encrypted.length-1) do
    #   new_character_position = calc_key_decrypt(i,reverse_encrypted,rotation_array)
    #   binding.pry
    #   while (new_character_position >= 40)
    #     new_character_position -= 39
    #   end
    #   final_string << @character_map.key(new_character_position)
    # end
    # return final_string




end
