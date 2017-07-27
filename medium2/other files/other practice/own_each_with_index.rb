def each_with_index(array)
  (0..array.size - 1).each do |index|
    yield(array[index], index)
  end
end


each_with_index(%w(four score and seven)) { |word, index| puts "#{index} #{word}" } 
