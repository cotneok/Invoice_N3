require_relative '../generate_id'
require_relative '../readcsv'
require_relative '../models/product'
require 'test/unit'

class TestCSV < Test::Unit::TestCase
  def test_readcsv
    hash_products1 = {
      '011' => 2,
      '014' => 1
    }
    hash_products2 = {
      'a' => 3,
      '015' => 4,
    }
    hash_products3 = {
      '011 ' => 2,
      '014 ' => 1
    }
    read1 = ReadCsv.new('../data.csv',hash_products1)
    read2 = ReadCsv.new('../data.csv',hash_products1)
    read3 = ReadCsv.new('../data.csv',hash_products1)
    product1 = Product.new('011','Galaxy Note 9','Black 128GB','1800')
    product2 = Product.new('014','Samsung Galaxy S9','Black 128GB','1500')
    products = [product1,product2]

    assert_equal(products,read1.read_csv_data)
    assert_empty(read2.read_csv_data)
    assert_equal(products,read3.read_csv_data)
    refute_nil(read3.read_csv_data)
  end
end
