class Test
  @var = 99 
  def self.var
    @var
  end

  def self.var=(value)
    @var = value
  end
end

puts "Original value = #{Test.var}"
Test.var = 'cat'
puts "New value = #{Test.var}"
