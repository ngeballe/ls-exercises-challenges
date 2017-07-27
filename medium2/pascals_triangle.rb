class Triangle
  def initialize(num_rows)
    @num_rows = num_rows
  end

  def rows
    result = [[1]] if @num_rows >= 1
    (2..@num_rows).each do
      result << new_row(result.last)
    end
    result
  end

  def new_row(previous_row)
    [1] + previous_row.each_cons(2).map { |pair| pair.reduce(:+) } + [1]
  end
end
