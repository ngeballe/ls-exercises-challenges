require 'pry'

def combination(array, num)
  # result = []
  # # array.each_with_index do |element, index|
  # #   # (index..array.size).each do |

  # # end
  # result

  if num == 1
    array.map { |element| [element] }
  else
    previous = combination(array, num - 1)
    result = previous[0..-2].flat_map.with_index do |element, index|
      binding.pry unless array[index + 1..-1]
      element.product(array[index + 1..-1])
    end
    result
  end
end


# p [1, 2, 3, 4].combination(2).to_a == [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]
# p [1, 2, 3, 4].combination(1).to_a == [[1], [2], [3], [4]]


# p combination([1, 2, 3], 1)
# p combination([1, 2, 3], 2)
# p combination([1, 2, 3], 2) == [1, 2, 3].combination(2)

array = [*1..10]
p combination(array, 7) #== array.combination(7)
