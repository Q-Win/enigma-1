require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require './lib/enigma'
require './lib/offset'
require './lib/key_generator'



class EnigmaTest < Minitest::Test

  def test_it_exists
    e = Enigma.new

    assert_instance_of Enigma, e
  end

  def test_we_get_new_character_position
    e = Enigma.new
    message = "cats"
    offset_array = [21,24,36,49]

    assert_equal "xyq3", e.new_character_position(message,offset_array)
  end

  def test_we_get_new_character_position_2
    e = Enigma.new
    message = "hello world"
    offset_array = [21,24,36,49]

    assert_equal "33iv0vty,0a", e.new_character_position(message,offset_array)
  end

  def test_we_can_encrypt
    e = Enigma.new
    actual = e.encrypt("hello world","12345","260818")

    assert_equal "33iv0vty,0a", actual
  end

  def test_we_can_decrypt
    e = Enigma.new
    actual = e.decrypt("33iv0vty,0a", "12345","260818")

    assert_equal "hello world", actual
  end

  def test_calc_key_encrypt
    e = Enigma.new

    actual = e.calc_key_encrypt(0,"hello",[21,24,36,49])

    assert_equal 29, actual
  end

  def test_calc_key_decrytp
    e = Enigma.new
    actual = e.calc_key_decrypt(0,"3",[21,24,36,49])

    assert_equal 8, actual
  end

  def test_it_can_grab_last_for_from_crack
    e = Enigma.new
    encrypted = "it3kntw"

    assert_equal ["k","n","t","w"], e.crack_last_four(encrypted)
  end

  def test_it_can_find_rotation_array_from_last_four
    e = Enigma.new
    encrypted_four = ["k","n","t","w"]
    date = 260818

    assert_equal [24,21,49,36], e.crack_rotation_array(0,encrypted_four,date)
  end

  def test_it_can_create_decrypted_crack
    e = Enigma.new
    encrypted = "it3kntw"
    # rotation_array = [24,21,49,36]

    assert_equal "..end..", e.crack(encrypted, 260818)

  end
end
