require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require './lib/key_generator'


class KeyGeneratorTest < Minitest::Test

  def test_it_exists
    k = KeyGenerator.new

    assert_instance_of KeyGenerator, k
  end

  def test_key_is_5_chars
    k = KeyGenerator.new.random_key

    assert_equal 5, k.length
  end

  def test_it_generates_a_random_number
      k = KeyGenerator.new.random_key.to_i

      assert (1..99999).include?(k)
  end
  
end
