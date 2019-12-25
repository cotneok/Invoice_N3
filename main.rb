require_relative 'modules/saveable'
require_relative 'models/product'
require_relative 'models/company'
require_relative 'readcsv'
require_relative 'price_calculator'
require_relative 'generate_id'
require_relative 'models/invoice'
require_relative 'modules/saveable'

puts "Type buyer:"
buyer = gets.chomp

products = {}
puts 'Type comma-separated ID and Quantity'
puts 'If you want to exit please type \'exit\' or empty line'

while true
	line = gets.chomp
	splited_array = line.split(',')
	splited_array[0] = splited_array[0].to_s
	splited_array[1] = splited_array[1].to_s
	products[splited_array[0].gsub(/ /, "")] = splited_array[1].gsub(/ /, "")
	break if line.empty? or line == 'exit'
	p products
end

buyerComp = Company.new(buyer)
sellerComp = Company.new('Vabaco')

readcsv = ReadCsv.new('data.csv',products)
products_arr = readcsv.read_csv_data

generateid = Generateid.new('id_storage.txt')
generateid.readtxt
id = generateid.id
generateid.writetext

calculate = CalculatePrice.new(products_arr, products)
price = calculate.price_with_vat(products_arr, products)
puts price
vat = calculate.vat(products_arr, products)
puts vat

invoice = Invoice.new(id,buyerComp,sellerComp,products_arr,price,vat,products)
print invoice
Saveable.save_as_pdf(invoice.to_s,id)
