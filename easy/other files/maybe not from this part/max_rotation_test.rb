require 'minitest/autorun'
require_relative 'max_rotation'

class MaxRotationTest < Minitest::Test
  def test_number
    assert_equal 321579, max_rotation(735291)    
  end

  def test_1_digit_number
    # skip
    assert_equal 3, max_rotation(3)
  end

  def test_2_digit_number
    # skip
    assert_equal 53, max_rotation(35)
  end

  def test_drop_leading_zero
    # skip
    assert_equal 15, max_rotation(105)
  end

  def test_big_number
    # skip
    assert_equal 7_321_609_845, max_rotation(8_703_529_146)
  end
end
