module Taxable
  Percent = 18.0
  def calculate_tax(number)
    number = number.to_f
    number *= (Percent / 100.0)
  end
end
