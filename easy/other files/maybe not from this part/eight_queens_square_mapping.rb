require 'pry'

def compatible?(square1, square2)
  # each piece of data should be different
  square1.each_with_index.all? do |datum, index|
    datum != square2[index]
  end
end

squares = (0..7).to_a.product (0..7).to_a

squares_mapped = squares.map do |row, column|
  # r, c, se_diag, sw_diag
  [row, column, row - column, row + column]
end

squares_mapped.each do |square|
  potential_buddies = squares_mapped.select do |other_square|
    compatible?(other_square, square)
  end
  # get potential buddies

  # different 0

  binding.pry
end

# p compatible?([0, 0, 0, 0], [0, 1, 2, 3]) == false
# p compatible?([0, 0, 0, 0], [2, 1, 0, 3]) == false
# p compatible?([0, 0, 0, 0], [4, 1, 2, 3]) == true


