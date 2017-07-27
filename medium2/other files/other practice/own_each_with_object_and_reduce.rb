require 'pry'

def each_with_object(array, object)
  array.each do |item|
    yield(item, object)
  end
  object
end

def reduce(array, accumulator = nil)
  accumulator ||= array.shift
  array.each do |item|
    accumulator = yield(accumulator, item)
  end
  accumulator
end

# In reduce, goal is one thing -- it returns accumulator
# In EWO, goal is many things -- many to many
# EWO won't work if the object you want to carry is immutable -- e.g. number, symbol


# p each_with_object([*1..5], {}) { |n, result| result[n] = n**2 } == { 1 => 1, 2 => 4, 3 => 9, 4 => 16, 5 => 25 }
# p each_with_object(%w(a b c d e), []) { |letter, result| result << letter.upcase * 2 } == %w(AA BB CC DD EE)

# # p reduce([*1..100]) { |sum, n| sum + n } == 5050
# # p reduce([*'a'..'h'], '...') { |word, letter| letter + word } == 'hgfedcba...'
# p reduce([*1..5]) { |product, num| num * product } == 120

b = [:tom, :dick, :harry]

b.each_with_object(:'') do |sym, new_sym|
  binding.pry
  new_sym = (new_sym.to_s + sym.to_s).to_sym
end

