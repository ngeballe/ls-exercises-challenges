def square_root(num)
  raise "num can't be negative" if num < 0
  # raise ArgumentError, "num can't be negative" if num < 0
  Math.sqrt(num)
end

p square_root(49)
p square_root(0)
p square_root(-1)
