class SimpleLinkedList
  def initialize(from_array = nil)
    # @elements = from_array || []
    element_values = from_array || []
    @elements = []
    # element_values.reverse_each do |element_value|
    element_values.reverse_each do |element_value|
      push(element_value)
    end
  end

  def size
    @elements.size
  end

  def empty?
    @elements.empty?
  end

  def push(value)
    # @elements.unshift(Element.new(value, head))
    @elements.push(Element.new(value, head))
  end

  def pop
    # @elements.shift.datum
    @elements.pop.datum
  end

  def peek
    return nil if empty?
    # @elements.to_enum.peek.datum
    # require 'pry'; binding.pry # if to_a == [1, 2]
    # head.datum
    # to_a.first
    head.datum
  end

  def head
    # @elements.first
    # require 'pry'; binding.pry
    @elements.last
  end

  def to_a
    @elements.map(&:datum).reverse
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end

  def self.from_a(array)
    new(array)
  end
end

class Element
  attr_reader :datum, :next

  def initialize(number, next_element = nil)
    @datum = number
    @next = next_element
  end

  def tail?
    true
  end
end
