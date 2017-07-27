data = [['Kate', 98], ['Zubin', 92], ['Joey', 92]]

# sort by score, then name
result = []

sorted = data.group_by { |el| el[1] }.sort.to_h

sorted.values.each do |tied_set|
  result += tied_set.sort_by { |el| el[0] }
end

p result

