def partition(array)
  # truthies = []
  # falsies = []
  # array.each do |item|
  #   if yield(item)
  #     truthies << item
  #   else
  #     falsies << item
  #   end
  # end
  # [truthies, falsies]

  array.each_with_object([[], []]) do |item, true_and_false|
    if yield(item)
      true_and_false[0] << item
    else
      true_and_false[1] << item
    end
  end
end

def group_by(array)
  # loop through array with each - EWO w/ hash
  # yield(item) -> if it's a hash key, add the item to that key's value
  # if it's not, create a new key-value pair for item and yield(item)
  # return the hash

  array.each_with_object({}) do |item, groups|
    value = yield(item)
    if groups.key?(value)
      groups[value] << item
    else
      groups[value] = [item]
    end
  end
end

# p partition([*1..8]) { |n| n.even? } == [[2, 4, 6, 8], [1, 3, 5, 7]]
# p partition(%w(Tom Ron Olivia Adam Eden Bob)) { |name| name =~ /\A[aeoiou]/i } == [%w(Olivia Adam Eden), %w(Tom Ron Bob)]

p group_by([*1..8]) { |n| n % 3 } == { 1 => [1, 4, 7], 2 => [2, 5, 8], 0 => [3, 6] }
p group_by(%w(Alan Bob Aiden Betsy Billie Alicia)) { |name| name[0] } `== { 'A' => %w(Alan Aiden Alicia), 'B' => %w(Bob Betsy Billie) }
