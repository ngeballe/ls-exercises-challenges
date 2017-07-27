Struct.new("Customer", :name, :address)
Struct::Customer.new("Dave", "123 Main")

Customer = Struct.new(:name, :address) do
  def to_s
    "#{self.name} lives at #{self.address}"
  end
end

p Customer.new("Daria", "649 Nowhere Ln").to_s
p Customer.new("Jen", "999 Cain Ln").to_s
