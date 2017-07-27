# 3 queens

squares = (0..3).to_a.product (0..3).to_a

squares_mapped = squares.map do |row, column|
  # r, c, se_diag, sw_diag
  [row, column, row - column, row + column]
end

