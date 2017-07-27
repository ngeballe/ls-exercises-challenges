require 'pry'

class Sieve
  attr_reader :primes

  def initialize(limit)
    # @limit = limit
    @range = 2..limit
  end

  def primes
    numbers_hash = {}
    @range.each { |num| numbers_hash[num] = :unmarked }
    until numbers_hash.none? { |_, v| v == :unmarked }
      # take the next available unmarked # & add it to the list of primes
      # numbers_hash.
      next_unmarked = numbers_hash.keys.detect do |number|
        numbers_hash[number] == :unmarked
      end
      numbers_hash[next_unmarked] = :prime
      # mark all mulitples of the number as composites
      numbers_hash.each { |k, _| numbers_hash[k] = :composite if k > next_unmarked && k % next_unmarked == 0 }
    end
    # return primes
    numbers_hash.select { |k, v| v == :prime }.keys
  end
end
