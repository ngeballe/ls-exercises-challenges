class ValueError < StandardError; end

class Board
  def self.transform(input)
    raise ValueError unless input.map(&:size).uniq.size == 1
    border_row_regex = /\A\+-+\+\z/
    unless input[0] =~ border_row_regex && input[-1] =~ border_row_regex
      raise ValueError
    end

    @input = input

    input.map.with_index do |row, row_idx|
      transform_row(row, row_idx)
    end
  end

  def self.mine_count(row_idx, col_idx)
    result = 0
    (row_idx - 1..row_idx + 1).each do |neighbor_row_idx|
      (col_idx - 1..col_idx + 1).each do |neighbor_col_idx|
        result += 1 if @input[neighbor_row_idx][neighbor_col_idx] == '*'
      end
    end
    result
  end

  def self.transform_row(row, row_idx)
    return row if row_idx.zero? || row_idx == @input.size - 1

    transformed_row_array = row.chars.map.with_index do |char, col_idx|
      raise ValueError unless [' ', '|', '*'].include?(char)
      if char == ' '
        count = mine_count(row_idx, col_idx)
        count.zero? ? ' ' : count.to_s
      else
        char
      end
    end
    transformed_row_array.join
  end
end
