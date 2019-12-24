class CalculatePrice
  include Taxable

  def CalculatePrice.price_with_vat(products)
    sum = 0
    products.each do |product|
      sum += product.price + calculate_tax(product.price)
    end
    sum
  end

  def CalculatePrice.vat(products)
    vat_sum = 0
    products.each do |product|
      vat_sum += calculate_tax(product.price)
    end
    vat_sum
  end
end
