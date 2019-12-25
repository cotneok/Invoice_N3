require 'csv'
require_relative 'models/product'

class ReadCsv
	attr_reader :file_path
	def initialize(file_path, input_hash)
		@file_path = file_path
		@product_array = []
		@input_hash = {}
		input_hash.each do |key, value|
			@input_hash[key.gsub(/ /, "")] = value
		end
	end

	def read_csv_data
		CSV.foreach(@file_path, headers: true) do |row|
			if @input_hash[row["id"].gsub(/ /, "")]
				@product_array << Product.new(row["id"].rstrip, row["product"].rstrip, row["description"].rstrip, row["price"].rstrip)
			end
		end
		@product_array
	end
end
