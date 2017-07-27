class Queens
  attr_reader :white, :black, :board

  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError if white == black
    @white = white
    @black = black
    set_board
  end

  def to_s
    rows = board.map do |row|
      row.join(' ')
    end
    rows.join("\n")
  end

  def attack?
    same_row? || same_column? || same_diagonal?
  end

  private

  def set_board
    @board = Array.new(8) { Array.new(8) { '_' } }
    @board[black[0]][black[1]] = 'B'
    @board[white[0]][white[1]] = 'W'
  end

  def same_row?
    white[0] == black[0]
  end

  def same_column?
    white[1] == black[1]
  end

  def same_diagonal?
    row_distance == column_distance
  end

  def row_distance
    (white[0] - black[0]).abs
  end

  def column_distance
    (white[1] - black[1]).abs
  end
end
