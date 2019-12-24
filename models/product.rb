class Product

	attr_accessor :id, :name, :description, :price

	def initialize(id, name, decription, price)
		@id = id
		@name = name
		@decription = description
		@price = price
	end
end
