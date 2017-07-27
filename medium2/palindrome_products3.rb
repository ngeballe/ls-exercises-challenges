# palindromes
class Palindromes
  def initialize(factors)
    @min_factor = factors[:min_factor] || 1
    @max_factor = factors[:max_factor]
  end

  def generate
    @palindromes = {}
    (@min_factor..@max_factor).each do |first_factor|
      (first_factor..@max_factor).each do |second_factor|
        product = first_factor * second_factor
        next unless palindrome?(product)
        palindrome = Palindrome.new(product, first_factor, second_factor)
        update_palindromes(palindrome)
      end
    end
  end

  def largest
    @palindromes[:largest]
  end

  def smallest
    @palindromes[:smallest]
  end

  private

  def palindrome?(num)
    num.to_s == num.to_s.reverse
  end

  def update_palindromes(palindrome)
    if @palindromes.empty?
      @palindromes[:smallest] = palindrome
      @palindromes[:largest] = palindrome
    elsif palindrome < @palindromes[:smallest]
      @palindromes[:smallest] = palindrome
    elsif palindrome == @palindromes[:smallest]
      @palindromes[:smallest].add_factors(palindrome)
    elsif palindrome == @palindromes[:largest]
      @palindromes[:largest].add_factors(palindrome)
    elsif palindrome > @palindromes[:largest]
      @palindromes[:largest] = palindrome
    end
  end
end

class Palindrome
  include Comparable

  attr_reader :value, :factors

  def initialize(value, *factors)
    @value = value
    @factors = [factors]
  end

  def add_factors(other)
    @factors += other.factors
  end

  def <=>(other)
    @value <=> other.value
  end
end
