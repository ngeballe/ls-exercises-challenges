evens = (1..10).each_with_object([]) do |i, a|
  a << i * 2
end

p evens

evens = (1..10).map { |i| i * 2 }
p evens

names = %w(Jennifer Jessica Jill Ruth Kate Samantha)
j_names = names.each_with_object([]) do |name, valid_names|
  valid_names << name if name.start_with?('J')
end
p j_names

j_names = names.select { |name| name.start_with?('J') }
p j_names

illustrious_j_names = names.each_with_object([]) do |name, illustrious_names|
  illustrious_names << "The Illustrious #{name}" if name.start_with?("J")
end

p illustrious_j_names

illustrious_j_names = names.select { |name| name.start_with?("J") }.map { |name| "#The Illustrious #{name}"}
