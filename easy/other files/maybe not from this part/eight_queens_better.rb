require 'pry'

def check_diagonals(rows)
  # check against column
  # rows.each_with_index do |row_num, col_num|
  #   southeast_diagonal = row_num - col_num
  #   southwest_diagonal = row_num + col_num
  #   binding.pry
  # end  
  se_diag_nums = []
  sw_diag_nums = []
  rows.each_with_index do |row, column|
    se_diag_num = row - column
    return false if se_diag_nums.include?(se_diag_num)
    se_diag_nums << se_diag_num
    sw_diag_num = row + column
    return false if sw_diag_nums.include?(sw_diag_num)
    sw_diag_nums << sw_diag_num
  end
  true
end

# based on video
row_positions = (0..7).to_a

# which row is each column's queen in?
possibilities = row_positions.permutation.to_a

p possibilities.size

p possibilities[0]

result_count = possibilities.count do |rows|
  check_diagonals(rows)
  # binding.pry
end

p result_count

# row = (0..7).to_a
# column = (0..7).to_a



