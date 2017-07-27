
def speechify
  puts "Get ready to listen to an amazing speech..."
  yield
  puts "Thank you, God bless you, and God bless America!"
end

speechify do
  puts "Four score and seven years ago . . . "
end

speechify do
  puts "I had a little rooster, my rooster pleased me . . ."
end

