module FreeProduct
  def self.calculate(product, quantity, minimum_quantity = 1)
    return if product.nil?

    result = []
    quantity.times do |i|
      result << { name: product.name, price: product.price }
      result << { name: product.name, price: 0 } if ((i + 1) % minimum_quantity).zero?
    end

    result
  end
end
