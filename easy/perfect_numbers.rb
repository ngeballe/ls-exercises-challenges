class PerfectNumber
  def self.classify(number)
    raise RuntimeError, "Must give a valid number" if number < 2

    sum_of_factors = self.factors(number).reduce(:+)

    if sum_of_factors < number
      'deficient'
    elsif sum_of_factors > number
      'abundant'
    else
      'perfect'
    end
  end

  def self.factors(number)
    (1..(number - 1)).select do |potential_factor|
      number % potential_factor == 0
    end
  end
end

