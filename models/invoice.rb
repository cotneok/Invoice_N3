class Invoice

	attr_accessor :id, :seller, :buyer, :products, :price, :date

	def initialize(id, buyer, seller, products, price, vat)
		@id = id
		@buyer = buyer
		@seller = seller
		@products = products
		@price = price
		@vat = vat
		time = Time.now
		@date = "#{time.day}/#{time.month}/#{time.year}"
	end

	def to_s
		txt = "\nINVOICE №#{id}\n\nSeller: #{seller} -> Buyer: #{buyer}\n"
		CSV.foreach("order#{id}.csv", headers: true) do |row|
			txt += "\nID: #{row['id']} | Product: #{row['product']} | Description: #{row['desc']} | Price: #{row['price']} | x#{row['qty']}"
			txt += "\n----------------------------------------------------------------------------------------------------------------"
		end
		txt += "\n\nTotal price to pay: #{price}GEL\n\nIncluding the taxes: #{vat}GEL\n\nDate: #{date}"
	end
end
