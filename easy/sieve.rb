class Sieve
  def initialize(limit)
    @range = 2..limit
  end

  def primes
    primes = []
    unmarked = @range.to_a

    until unmarked.empty?
      next_unmarked = unmarked.shift
      primes << next_unmarked
      unmarked.reject! { |number| (number % next_unmarked).zero? }
    end

    primes
  end
end
