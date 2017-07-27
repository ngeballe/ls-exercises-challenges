# animal = "cat"

# def animal.speak
#   puts "The #{self} says miaow"
# end

# animal.speak
# puts animal.upcase


animal = "dog"
class << animal
  def speak
    puts "The #{self} says WOOF!"
  end
end

animal.speak
