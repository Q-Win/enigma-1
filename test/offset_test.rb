require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require './lib/offset'


class OffsetTest < Minitest::Test

  def test_it_exists
    o = Offset.new("12345","260818")

    assert_instance_of Offset, o
  end

  def test_it_can_square_date
    o = Offset.new("12345","260818")

    assert_equal 68026029124, o.square_date
  end

  def test_it_can_take_last_four
    o = Offset.new("12345","260818")

    assert_equal 9124, o.last_four_of_date
  end

  def test_it_can_build_array_key
    o = Offset.new("12345","260818")

    assert_equal [12,23,34,45], o.build_array_key
  end

  def test_it_can_build_date_array
    o = Offset.new("12345","260818")

    assert_equal [9,1,2,4], o.build_date_array
  end

  def test_it_build_offset_array
    o = Offset.new("12345","260818")

    assert_equal [21,24,36,49], o.build_offset_array
  end

end
