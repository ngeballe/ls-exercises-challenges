class SimpleLinkedList
  def initialize(from_array = nil)
    # @elements = from_array || []
    element_values = from_array || []
    @elements = []
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
    @elements.unshift(Element.new(value, head))
  end

  def pop
    @elements.shift.datum
  end

  def peek
    return nil if empty?
    @elements.to_enum.peek.datum
  end

  def head
    @elements.first
  end

  def to_a
    @elements.map(&:datum)
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
