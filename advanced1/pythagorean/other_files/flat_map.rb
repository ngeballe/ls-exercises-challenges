def flat_map(array)
  result = []
  counter = 0
  while counter < array.size
    element = array[counter]
    # p yield(element)
    # result << yield(element)
    result += yield(element)
    counter += 1
  end
  result
  # result.flatten
end

p flat_map([1, 2, 3, 4]) { |e| [e, -e] } == [1, -1, 2, -2, 3, -3, 4, -4]
p flat_map([[1, 2], [3, 4]]) { |e| e + [100] } == [1, 2, 100, 3, 4, 100]

test_array = [[3, [6]], [4, [8]], [5, [10]]]
p flat_map(test_array) { |e| e + [100] } == [3, [6], 100, 4, [8], 100, 5, [10], 100]
# p test_array.map { |e| e + [100] }.flatten == flat_map(test_array) { |e| e + [100] }
p flat_map(test_array) { |e| e + [100] } == test_array.flat_map { |e| e + [100] }

p test_array.flat_map { |e| e + [100] }
