#require_relative 'modules/saveable'
#require_relative 'product'
#require_relative 'company'
require_relative 'readcsv'
require_relative 'models/price_calculator'

puts "shemoiyvane myidveli"
buyer = gets.chomp

products = {}
puts 'Type comma-separated ID and Quantity'
puts 'If you want to exit please type \'exit\' or empty line'

while true
	line = gets.chomp
	splited_array = line.split(',')
	products[splited_array[0]] = splited_array[1]
	break if line.empty? or line == 'exit'
	p products
end

buyerComp = Company.new(buyer)
sellerComp = Company.new('Vabaco')

readcsv = ReadCsv.new("data.csv",products)
products_arr = readcsv.read_csv_data

generateid = Generateid.new("id_storage.txt")
id = generateid.readtxt
generateid.writetext

price = CalculatePrice.price_with_vat(products_arr)
vat = CalculatePrice.vat_sum(products_arr)

invoice = Invoice.new(id,buyerComp,sellerComp,products_arr, price, vat)
