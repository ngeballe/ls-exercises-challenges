require 'pry'

class Sieve
  attr_reader :primes

  def initialize(limit)
    # @limit = limit
    @range = 2..limit
  end

  def primes
    numbers = [nil] * @range.size
    # 0, 1, 2 ..., range limit
    while numbers.any?(&:nil?)
      # mark first prime
      index_of_first_prime = numbers.index(&:nil?)
      numbers[index_of_first_prime] = :prime
      # mark multiples of it as composite
      numbers.each_index do |index|
        next if index <= index_of_first_prime
        if (index + 2) % (index_of_first_prime + 2) == 0
          numbers[index] = :composite
        end
      end
    end
    # return indices of primes
    numbers.each_with_index.select { |category, _| category == :prime }.map { |_, number| number + 2 }
  end
end
