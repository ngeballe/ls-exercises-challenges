class SumOfMultiples
  def initialize(*factors)
    @factors = factors
  end

  def to(limit)
    # multiples = []
    # (1..limit - 1).each do |number|
    #   multiples << number if @factors.any? { |factor| number % factor == 0 }
    # end
    # (1..limit - 1).each_with_object([]) do |number, multiples|
    #   # binding.pry
    #   multiples << number if @factors.any? { |factor| number % factor == 0 }
    # end
    multiples = (1..limit - 1).select do |number|
      @factors.any? { |factor| number % factor == 0 }
    end
    multiples.reduce(0, :+)
  end

  def self.to(limit)
    new(3, 5).to(limit)
  end
end
