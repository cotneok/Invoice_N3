require_relative 'modules/taxable'

class CalculatePrice
  include Taxable

  def initialize(products, hash_products)
    @products = products
    @hash_products = hash_products
  end

  def price_with_vat(products)
    sum = 0
    products.each do |product|
      sum += (product.price.to_f  + calculate_tax(product.price).to_f) * @hash_products[product.id].to_f
    end
    sum
  end

  def vat(products)
    vat_sum = 0
    products.each do |product|
      vat_sum += calculate_tax(product.price).to_f * @hash_products[product.id].to_f
    end
    vat_sum
  end
end
