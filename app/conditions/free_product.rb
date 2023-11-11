module FreeProduct
  def self.calculate(product, quantity, minimum_quantity = 1)
    return if product.nil?

    price = quantity >= minimum_quantity ? 0 : product.price
    { name: product.name, price: price }
  end
end
