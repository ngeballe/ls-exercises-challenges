class Bst
  attr_reader :data, :left, :right

  def initialize(number)
    @data = number
  end

  def insert(number)
    if number <= @data
      if @left
        @left.insert(number)
      else
        @left = Bst.new(number)
      end
    else
      if @right
        @right.insert(number)
      else
        @right = Bst.new(number)
      end
    end
  end

  def each
    return enum_for(:each) unless block_given?
    @left &.each { |item| yield item }
    yield @data
    @right &.each { |item| yield item }
  end
end
