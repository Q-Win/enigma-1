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



end
