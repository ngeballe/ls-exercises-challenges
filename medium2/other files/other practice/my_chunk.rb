def chunk(array)
  result = []
  # current_value = yield(array[0])
  # items_yielding_current_value = [array[0]]
  current_value = yield(array[0])
  items_yielding_current_value = [array[0]]
  # array[1..-1].each do |item|
  array[1..-1].each do |item|
    if current_value == yield(item)
      items_yielding_current_value << item
      next
    end
    result << [current_value, items_yielding_current_value]
    current_value = yield(item)
    items_yielding_current_value = [item]

    # items_yielding_current_value << item && next if yield(item) == current_value
    # result << [current_value, items_yielding_current_value]
    # current_value = yield(item)
    # items_yielding_current_value = [item]

    # if yield(item) != current_value
    #   result << [current_value, items_yielding_current_value]
    #   current_value = yield(item)
    #   items_yielding_current_value = [item]
    # else
    #   items_yielding_current_value << item
    # end
  end
  result << [current_value, items_yielding_current_value]
end

a = [*1..20]
# a = [*1..5]

# a.chunk { |n| n / 4 }.each { |value, chunk| p "#{value}: #{chunk}" }

my_way = chunk(a) { |n| n / 4 }
p my_way

traditional_way = a.chunk { |n| n / 4 }.to_a
p traditional_way

p my_way == traditional_way
# p a.chunk { |n| n / 4 } == chunk(a) { |n| n / 4 }
