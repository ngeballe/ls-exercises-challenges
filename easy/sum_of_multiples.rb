class SumOfMultiples
  def initialize(*numbers)
    @numbers = numbers
  end

  def self.to(limit, numbers = [3, 5])
    raise "please give a positive integer for the limit" unless limit.instance_of?(Fixnum) && limit > 0
    all_multiples = numbers.map { |num| num.step(limit - 1, num).to_a }.reduce(:+).uniq
    all_multiples.reduce(0, :+)
  end

  def to(limit)
    self.class.to(limit, @numbers)
  end
end
