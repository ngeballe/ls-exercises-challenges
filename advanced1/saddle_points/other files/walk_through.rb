class Matrix
  attr_reader :rows

  def initialize(matrix_string)
    @rows = matrix_string.split("\n").map do |row_string|
      row_string.split.map(&:to_i)
    end
  end

  def columns
    rows.transpose
  end

  def saddle_points
    saddle_point_coords = []

    rows.each_with_index do |row, x|
      row.each_with_index do |number, y|
        if saddle_point?(x, y)
          saddle_point_coords << [x, y]
        end
      end
    end

    saddle_point_coords
  end

  private

  def saddle_point?(x, y)
    value = rows[x][y]
    row = rows[x]
    column = columns[y]
    value == row.max && value == column.min
  end
end
