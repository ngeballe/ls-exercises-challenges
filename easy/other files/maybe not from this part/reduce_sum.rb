factor_sum = (1..9).reduce do |sum, n|
  10 % n == 0 ? sum + n : sum
end

p factor_sum
