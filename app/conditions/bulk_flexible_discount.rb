module BulkFlexibleDiscount
  def self.calculate(product, quantity, new_price = 450, minimum_quantity = 3)
    return if product.nil? || new_price.nil?

    price = quantity >= minimum_quantity ? new_price : product.price
    { name: product.name, price: price }
  end
end
