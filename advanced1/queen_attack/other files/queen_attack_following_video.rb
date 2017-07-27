# data
#  - 8 x 8 board
#  - [x, y] for the white queen
#  - [x, y] for the black queen



# Queens
#   - default
#   - validation
#     - can't be the same position
#   - to_s: string representation of the board
#     - 8 rows, underscore and spaces
#     - print out W or B if the position is occupied by a queen
#   - attack?
#    - same row
#     - same x for white and black queens
#    - same column
#     - same y for white and black queens
#    - same diagonal
#     - (x2 - x1) == (y2 - y1)


# [0, 1]

class Queens
  class Position < Struct.new(:x, :y); end

  attr_reader :black, :white

  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError if white == black
    # @white_queen_position = white
    # @black_queen_position = black
    @white_queen_position = Position.new(*white)
    @black_queen_position = Position.new(*black)
  end

  def white
    [@white_queen_position.x, @white_queen_position.y]
  end

  def black
    [@white_queen_position.x, @white_queen_position.y]
  end

  def to_s
    result = ""
    (0..7).each do |row|
      (0..7).each do |column|
        case Position(row, column)
        when @black_queen_position
          result << "B "
        when @white_queen_position
          result << "W "
        else
          result << "_ "
        end
      end
      result.rstrip!
      result << "\n"
    end
    result.rstrip
  end

  def attack?
    same_row? || same_column? || same_diagonal?
  end

  def same_row?
    # white[0] == black[0]
    @white_queen_position.x == @black_queen_position.x
  end

  def same_column?
    # @white_queen_position[1] == @white_queen_position[0]
    @white_queen_position.y == @black_queen_position.y
  end

  def same_diagonal?
    # (@white_queen_position[0] - @black_queen_position[0]).abs == (@white_queen_position[1] - @black_queen_position[1]).abs
    (@white_queen_position.x - @black_queen_position.x).abs == (@white_queen_position.y - @black_queen_position.y).abs
  end
end

# (white_x - black_x).abs == (white_y - black_y).abs

# white_x - black_x == white_y - black_y
# white_x - white_y == black_x - black_y
# or
# white_x - black_x == -(white_y - black_y)
# white_x - black_x == -white_y + black_y
# white_x - black_x == black_y - white_y
# white_x + white_y == black_x + black_y

