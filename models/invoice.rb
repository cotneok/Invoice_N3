class Invoice

	attr_accessor :id, :seller, :buyer, :products, :price, :date

	def initialize(id, buyer, seller, products, price, vat, hash_products)
		@id = id
		@buyer = buyer.to_s
		@seller = seller.to_s
		@products = products
		@price = price
		@vat = vat
		time = Time.now
		@date = "#{time.day}/#{time.month}/#{time.year}"
		@hash_products = hash_products
	end

	def to_s
		txt = "\nINVOICE №#{@id}\n\nSeller: #{@seller} -> Buyer: #{@buyer}\n"
		@products.each do |product|
			txt += "\nID: #{product.id} | Product: #{product.name} | Description: #{product.description} | Price: #{product.price} | x#{@hash_products[product.id]}"
			txt += "\n----------------------------------------------------------------------------------------------------------------"
		end
		txt += "\n\nTotal price to pay: #{@price}GEL\n\nIncluding the taxes: #{@vat}GEL\n\nDate: #{@date}"
	end
end
