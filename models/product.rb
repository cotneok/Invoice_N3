class Product

	attr_accessor :id, :name, :description, :price

	def initialize(id, name, description, price)
		@id = id
		@name = name
		@description = description
		@price = price
	end
end
