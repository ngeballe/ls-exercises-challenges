def generate_pattern(number)
  # for each # from 1 to the number:
  # put 1, 2, ... row_number
  # then puts *'s--how many? last_row_width - current_row_width
  width = (1..number).to_a.join.size
  (1..number).each do |row_number|
    string_of_numbers = (1..row_number).to_a.join
    string_of_asterisks = '*' * (width - string_of_numbers.size)
    puts string_of_numbers + string_of_asterisks
  end
end

generate_pattern(20)
