class Queens
  attr_reader :white, :black

  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError if white == black
    @white = white
    @black = black
  end

  def to_s
    rows = (0..7).map do |row_index|
      row = (0..7).map do |column_index|
        case [row_index, column_index]
        when white then 'W'
        when black then 'B'
        else            '_'
        end        
      end
    end
    rows.join("\n")
  end

  def attack?
    same_row? || same_column? || same_diagonal?
  end

  def same_row?
    white[0] == black[0]
  end

  def same_column?
    white[1] == black[1]
  end

  def same_diagonal?
    row_difference == column_difference
  end

  def row_difference
    (white[0] - black[0]).abs
  end

  def column_difference
    (white[1] - black[1]).abs
  end
end
