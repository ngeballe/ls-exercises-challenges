require 'pry'

all_squares = (0..7).to_a.product((0..7).to_a) # [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7], [2, 0], [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [2, 6], [2, 7], [3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6], [3, 7], [4, 0], [4, 1], [4, 2], [4, 3], [4, 4], [4, 5], [4, 6], [4, 7], [5, 0], [5, 1], [5, 2], [5, 3], [5, 4], [5, 5], [5, 6], [5, 7], [6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6], [6, 7], [7, 0], [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6], [7, 7]]

# queens = []
# # squares.each do |square|
# #   other_squares = squares.dup

# #   binding.pry
# # end

# # def possible_squares(occupied, all_squares)
# #   # all_squares where neither row nor column nor diagonal is occupied
# #   all_squares.reject do |row, column|
# #     row = 
# #   end
# # end

# def possible_squares_for_next_queen_with_one(queen_position, all_squares)
#   queen_row, queen_column = queen_position
#   all_squares.reject do |row, column|
#     column == queen_column || row == queen_row ||
#       (column - queen_column).abs == (row - queen_row).abs
#   end
# end

# # def possible_squares_for_next_queen(queen_positions, all_squares)
# #   occupied_rows = queen_positions.map { |position| position[0] }
# #   occupied_columns = queen_positions.map { |position| position[1] }
# #   occupied_southeast_diagonals = queen_positions.map { |position| southeast_diagonal(*position) }
# #   occupied_southwest_diagonals = queen_positions.map { |position| southwest_diagonal(*position) }
# #   # p occupied_rows
# #   # p occupied_columns
# #   # p occupied_southeast_diagonals
# #   # p occupied_southwest_diagonals

# #   all_squares.reject do |row, column|
# #     occupied_rows.include?(row) || occupied_columns.include?(column) ||
# #       occupied_southeast_diagonals.include?(southeast_diagonal(row, column)) ||
# #       occupied_southwest_diagonals.include?(southwest_diagonal(row, column))
# #   end
# # end

def southeast_diagonal(row, column)
  column - row
end

def southwest_diagonal(row, column)
  column + row
end



# # p possible_squares_for_next_queen([[0, 0], [1, 2]], all_squares)

# mapping = {}

# # all_squares.each do |row, column|
# #   # queen_squares = [square]
# #   # possibles = possible_squares_for_next_queen(queen_squares, all_squares)
# #   # p possibles
# #   # binding.pry
# #   # break
# #   mapping[[row, column]] = [:row, :column, :southeast_diagonal, :southwest_diagonal].zip([row, column, southwest_diagonal(row, column), southeast_diagonal(row, column)])
# # end

# # p mapping

# # rows - 0..7
# # columns - 0..7

# # p rows

# answer = [[[0, 0], [1, 1], [2, 2]],
# [[0, 0], [1, 2], [2, 1]],
# [[0, 1], [1, 0], [2, 2]],
# [[0, 1], [1, 2], [2, 0]],
# [[0, 2], [1, 0], [2, 1]],
# [[0, 2], [1, 1], [2, 0]]]

# # [0, 1, 2] crossed by 
# # 012
# # 021
# # 102
# # 120
# # 201
# # 210

rows = (0..7).to_a
columns = (0..7).to_a
column_permutations = columns.permutation.to_a

# columns.permutation = all the ways that there can be one of each column

southeast_diagonals = all_squares.map { |square| southeast_diagonal(*square) }
p southeast_diagonals

# permutaions of diags

# get possibilites w/ unique rows & columns
# possibilities = column_permutations.map do |columns|
#   rows.map.with_index { |row, index| [row, columns[index]] }
# end

# p possibilities



binding.pry

result = possibilities.count do |possibility|
  southeast_diagonals = possibility.map { |position| southeast_diagonal(*position) }
  southwest_diagonals = possibility.map { |position| southwest_diagonal(*position) }
  southeast_diagonals.uniq.count == 8 && southwest_diagonals.uniq.count == 8
end

p result
