require_relative '../modules/taxable'
require_relative '../price_calculator'
require_relative '../models/product'
require 'test/unit'

class PriceTest < Test::Unit::TestCase
  include Taxable
  def test_taxable
    assert_equal(18.0,calculate_tax(100))
    assert_equal(18.0,calculate_tax(100.0))
    assert_equal(-18.0,calculate_tax(-100.0))
    assert_equal(0.0,calculate_tax(0))
    assert_equal(6.3, calculate_tax(35))
  end

  def test_price
    product1 = Product.new(011,'Galaxy Note 9','Black 128GB',1800)
    product2 = Product.new(014,'Samsung Galaxy S9','Black 128GB',1500)
    products = [product1,product2]
    hash_products = {
      product1.id => 2,
      product2.id => 1
    }
    calculator = CalculatePrice.new(products,hash_products)
    price1 = 1800.0 * (1.0 + 18.0/100.0)
    price2 = 1500.0 * (1.0 + 18.0/100.0)
    price1 = price1 * hash_products[product1.id]
    price2 = price2 * hash_products[product2.id]
    assert_equal(price1 + price2, calculator.price_with_vat(products))
    assert_equal(calculate_tax(1800)*hash_products[product1.id] + calculate_tax(1500) *hash_products[product2.id], calculator.vat(products))
  end
end
