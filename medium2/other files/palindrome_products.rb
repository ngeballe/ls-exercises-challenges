# require 'pry'

class Palindromes
  def initialize(factors)
    @min_factor = factors[:min_factor] || 1
    @max_factor = factors[:max_factor]
  end

  def generate
    @palindromes = []
    (@min_factor..@max_factor).each do |factor1|
      (@min_factor..@max_factor).each do |factor2|
        factor_pair = [factor1, factor2]
        product = factor1 * factor2
        next unless palindrome?(product)
        palindrome = Palindrome.new(product, factor_pair)
        update_palindromes(palindrome, product, factor_pair)
      end
    end
  end

  def largest
    @palindromes.max_by(&:value)
  end

  def smallest
    @palindromes.min_by(&:value)
  end

  private

  def update_palindromes(palindrome, product, factor_pair)
    # Add palindrome to @palindromes if it's new
    # Otherwise, add factor_pair to existing palindrome in @palindromes
    palindrome_with_same_value = @palindromes.detect do |pal|
      pal.value == product
    end
    if palindrome_with_same_value
      index = @palindromes.index(palindrome_with_same_value)
      @palindromes[index] = palindrome_with_same_value
                            .add_factors(factor_pair)
    else
      @palindromes << palindrome
    end
  end

  def palindrome?(number)
    number.to_s == number.to_s.reverse
  end
end

class Palindrome
  attr_reader :value, :factors

  def initialize(value, factor_pair)
    @value = value
    @factors = [factor_pair.sort]
  end

  def add_factors(new_factor_pair)
    new_factor_pair.sort!
    @factors << new_factor_pair unless @factors.include?(new_factor_pair)
    self
  end
end
