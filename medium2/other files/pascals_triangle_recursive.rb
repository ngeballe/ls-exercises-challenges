require 'pry'

class Triangle
  def initialize(levels)
    @levels = levels
  end

  def rows
    # [[1], ...]
    generate_rows(@levels)
  end

  def generate_rows(levels)
    case levels
    when 1
      [[1]]
    when 2
      [[1], [1, 1]]
    else
      previous = generate_rows(levels - 1)
      new_row = [1] + previous[-1].each_cons(2).map { |pair| pair.reduce(:+) } + [1]
      previous << new_row
    end   
  end
end
