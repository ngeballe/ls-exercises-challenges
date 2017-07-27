all_squares = (0..7).to_a.product((0..7).to_a)

p all_squares.combination(8).size

all_squares.combination(8).select do |combination|
  # any on same row
  rows = combination.map { |pair| pair[0] }
  p rows
  next unless rows.uniq.size == 8
  break
  # columns = combination.map { |pair| pair[1] }
  # next unless columns.uniq.size == 8
end
