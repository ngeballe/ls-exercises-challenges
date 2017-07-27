require 'pry'

'''
8 queens, such that none can attack another
find the total # of all possible board solutions to this puzzle
'''

class Board
  def initialize
    # @squares = [[nil] * 8] * 8
    @squares = {}
    (1..64).each { |num| @squares[num] = nil }
    p @squares
  end

  def valid_arrangements_count
    valid_arrangements_count = 0
    possible_arrangements.each do |queen_positions|
      # go through each set of two, see if any two on same row
      next if queen_positions.combination(2).any? do |queen1, queen2|
        row(queen1) == row(queen2)
      end
      valid_arrangements_count += 1
    end
    valid_arrangements_count
  end

  def possible_arrangements
    @squares.keys.combination(8)
  end

  def two_in_same_row?(queen1, queen2)
    row(queen1) == row(queen2)
  end

  def row(queen)
    (queen - 1) / 8
  end
end

p Board.new.valid_arrangements_count

# plan how you'd solve it

# rep data
# problem-solving pattern

board = [[nil, nil, nil, nil, nil, nil, nil, nil],
         [nil, nil, nil, nil, nil, nil, nil, nil],
         [nil, nil, nil, nil, nil, nil, nil, nil],
         [nil, nil, nil, nil, nil, nil, nil, nil],
         [nil, nil, nil, nil, nil, nil, nil, nil],
         [nil, nil, nil, nil, nil, nil, nil, nil],
         [nil, nil, nil, nil, nil, nil, nil, nil],
         [nil, nil, nil, nil, nil, nil, nil, nil]]

queen1_position = [0, 3]
queen2_position = [2, 5]
queen3_position = [0, 7]

# choose a row (0..7) for queen1
# 


# for the board, no queens on same row?
# 


