require 'simplecov'
SimpleCov.start
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

    assert_equal [36,49,21,24], e.crack_rotation_array(0,encrypted_four,date)
  end

  def test_it_can_create_decrypted_crack
    e = Enigma.new
    encrypted_1 = "it3kntw"
    encrypted_2 = "g1iode.fdj.,"
    encrypted_3 = "lx9u xcz r"
    encrypted_4 = "e.,8bde89"

    assert_equal "..end..", e.crack(encrypted_1, 260818)
    assert_equal "quinn..end..", e.crack(encrypted_2, 280818)
    assert_equal "meg..end..", e.crack(encrypted_3, 280818)
    assert_equal "hi..end..",e.crack(encrypted_4, 280818)
  end

  def test_crack_can_find_original_array_by_rotating
    e = Enigma.new
    encrypted_1 = "it3kntw"
    encrypted_2 = "g1iode.fdj.,"
    encrypted_3 = "lx9u xcz r"
    encrypted_4 = "e.,8bde89"

    assert_equal [21,49,36,24],e.crack_find_original_rotation_array(encrypted_1, [24,21,49,36])
    assert_equal [24,21,49,36],e.crack_find_original_rotation_array(encrypted_2, [24,21,49,36])
    assert_equal [49,36,24,21],e.crack_find_original_rotation_array(encrypted_3, [24,21,49,36])
    assert_equal [36,24,21,49],e.crack_find_original_rotation_array(encrypted_4, [24,21,49,36])
  end

  def test_crack_key
    e = Enigma.new

    assert_equal "12345",e.crack_key([21,24,36,49],280818)
  end

  def test_it_can_calculate_key_find_key
    e = Enigma.new

    assert_equal "12345",e.find_key("3,moseesavty,9pit3kntw",280818)
  end

end
