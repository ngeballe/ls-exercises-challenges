# Pythagorean triplet
class Triplet
  attr_reader :a, :b, :c

  def self.where(options = {})
    triplets = []
    min_factor = options[:min_factor] || 1
    required_sum = options[:sum]

    range = min_factor..options[:max_factor]
    range.to_a.combination(3).each do |a, b, c|
      triplet = new(a, b, c)

      if triplet.pythagorean? && (!required_sum || a + b + c == required_sum)
        triplets << triplet
      end
    end

    triplets
  end

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def sum
    a + b + c
  end

  def product
    a * b * c
  end

  def pythagorean?
    a**2 + b**2 == c**2
  end
end
