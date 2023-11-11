module BulkFixedDiscount
  def self.calculate(product, quantity, minimum_quantity = 3)
    return if product.nil?

    special_price = ((product.price.to_f / 3) * 2)
    price = quantity >= minimum_quantity ? special_price : product.price
    { name: product.name, price: price.round(3) }
  end
end
