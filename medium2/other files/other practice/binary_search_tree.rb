require 'pry'

class Bst
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end

  def insert(number)
    new_bst = Bst.new(number)
    if number <= data
      left ? left.insert(number) : self.left = new_bst
    else
      right ? right.insert(number) : self.right = new_bst
    end
  end

  def each
    return all_data unless block_given?

    all_data.each do |data|
      yield(data)
    end
  end

  def all_data
    array = []
    # add each from left
    array << left.all_data.to_a if left
    # add data
    array << data # unless self.nil?
    # add each from right
    array << right.all_data.to_a if right
    array.flatten.each
  end
end
