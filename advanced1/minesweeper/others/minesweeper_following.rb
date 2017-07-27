# transformation rules:
# - go through each character
  # - if char is a space, transform it into num surrounding mines
    # - number of surrounding mines
      # - assuming the current char is at (x, y)
      # - the surrounding positions are (x-1, y-1), (x-1, y), (x-1, y+1), (x, y-1), (x, y), (x, y+1), (x+1, y-1), (x+1, y), (x+1, y+1)
      # - count and return the number of surrounding positions with character '*'
  # - for all other instances (not a space), keep the same char

# - faulty border rule and valid char rule
  # - for first and last row, begins and ends with "+", with all "-"s in the middle
  # - for other rows, begins and ends with "|", with characters in the middle all being "*" or " "

class ValueError < StandardError; end

class Board
  def initialize(input)
    validate_input(input)
    @cell = Array.new(ipnut.size) { Array.new(input[0].size) }
  end

  def transform!
    # two levels up loops that go through the chars, follow the rules ...

    # assemble a new board with new chars
  end

  def display
    # ['...', '...']
  end

  def self.transform(input)
    board = new(input)

    new_board = board.transform!
    new_board.display

    output = Array.new(input.size) { Array.new(input[0].size) }

    input.each_with_index do |row, x|
      row.chars.each_with_index do |char, y|
        output[x][y] = transform_char(char, x, y, input)
      end
    end
    # assemble output
    output.map(&:join)
  end

  def self.number_of_surrounding_mines(x, y, input)
     # - the surrounding positions are (x-1, y-1), (x-1, y), (x-1, y+1), (x, y-1), (x, y), (x, y+1), (x+1, y-1), (x+1, y), (x+1, y+1)
      # - count and return the number of surrounding positions with character '*'
    [input[x - 1][y - 1], input[x - 1][y], input[x - 1][y + 1], input[x][y - 1], input[x][y], input[x][y + 1], input[x + 1][y - 1], input[x + 1][y], input[x + 1][y + 1]].count('*')
  end

  def self.validate_input(input)
    # raise ValueError if input.map(&:size).uniq.size != 1
    fail ValueError, 'Input needs to have rows of the same size' unless rows_of_the_same_length?(input)
    fail ValueError, 'Invalid board pattern' unless valid_board_pattern?(input)
  end

  def self.rows_of_the_same_length?(input)
    input.all? { |row| row.size == input[0].size }
  end

  def self.valid_board_pattern?(input)
    first_row, last_row = input[0], input[-1]
    border_regex = /^\+-+\+$/
    first_row =~ border_regex && last_row =~ border_regex &&
      valid_middle_rows?(input)
  end

  def self.valid_middle_rows?(input)
    input[1..-2].all? { |row| row =~ /^\|[\s\*]+\|$/ }
  end

  def self.transform_char(char, x, y, input)
    if char == ' '
      num_mines = number_of_surrounding_mines(x, y, input)
      num_mines.zero? ? ' ' : num_mines.to_s
    else
      char
    end
  end
end
