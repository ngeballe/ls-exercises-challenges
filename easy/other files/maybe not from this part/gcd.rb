def gcd(num1, num2)
  smaller_num = [num1, num2].min
  # greatest_common_divider = 1
  # (2..smaller_num).each do |divider|
  #   greatest_common_divider = divider if num1 % divider == 0 && num2 % divider == 0
  # end
  # greatest_common_divider

  smaller_num.downto(0) do |divider|
    return divider if num1 % divider == 0 && num2 % divider == 0
  end
end

