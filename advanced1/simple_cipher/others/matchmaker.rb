require 'minitest/autorun'

class Person
  attr_reader :name

  def initialize(name = nil)
    @name = name || "Jane Doe"
  end
end

class Testing < Minitest::Test
  def test_fake_name
    person = Person.new
    assert_match(/Doe/, person.name)
  end
end
