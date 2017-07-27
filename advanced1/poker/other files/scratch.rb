a = [2, 4, 6, 8]

p a.map { |el| el * 10 }

p a.map { |el| [el] + [99] }
p a.flat_map { |el| [el] + [99] }
