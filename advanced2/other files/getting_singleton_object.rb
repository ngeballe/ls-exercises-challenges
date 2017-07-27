animal = 'dog'

def animal.speak
  puts "The #{self} says WOOF!"
end

singleton = class << animal
  def lie
    puts "The #{self} lies down"
  end
  self
end

animal.speak
animal.lie
puts "Singleton class object is #{singleton}"
puts "It defines #{singleton.instance_methods - 'cat'.methods}"

