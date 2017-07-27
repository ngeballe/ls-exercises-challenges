require 'minitest/autorun'
require_relative 'gcd'

class GCDTest < Minitest::Test
  def test_gcd
    assert_equal 3, gcd(9, 15)
  end

  def test_only_divider_is_one
    assert_equal 1, gcd(100, 11)
  end

  def test_another_pair
    assert_equal 14, gcd(14, 28)
  end
end
