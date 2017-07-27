require 'pry'

class Person
  def self.add_methods(method_names)
    method_names.each do |method_name|
      define_method method_name do
        puts "#{method_name.capitalize}ing"
      end
    end
  end

  def initialize(method_names)
    # singleton_methods.each do |method|
    # end
    # @method_name = singleton_methods[0]
    # self.class.add_methods(singleton_methods)

    method_names.each do |method_name|
      define_singleton_method method_name do
        puts "#{method_name.capitalize}ing"
      end
    end
    # class << self
    #   define_method method_name do |miles|
    #     puts "Walking #{miles} miles"
    #   end
    #   # singleton_methods.each do |method_name|
    #     # binding.pry
    #     # define_method method_name do
    #     #   puts method_name.to_s.captialize
    #     # end
    #   # end
    # end
  end
end

john = Person.new([:walk, :fly])

p john.singleton_methods
john.walk
john.fly

katie = Person.new([:sail, :nap, :work])
p katie.singleton_methods
katie.sail
katie.nap
katie.work

# john.walk(3)
# john.walk(7.5)

