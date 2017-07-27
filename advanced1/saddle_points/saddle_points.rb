class Matrix
  attr_reader :rows

  def initialize(matrix_string)
    @rows = matrix_string.split("\n").map do |row_string|
      row_string.split.map(&:to_i)
    end
  end

  def columns
    @rows.transpose
  end

  def saddle_points
    coordinates = []
    rows.each_with_index do |row, row_index|
      row.each_with_index do |number, column_index|
        if number == row.max && number == columns[column_index].min
          coordinates << [row_index, column_index]
        end
      end
    end
    coordinates
  end
end
