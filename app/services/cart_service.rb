class CartService
  def initialize(params)
    @products = params[:products]
    @result = []
  end

  def call
    @products.each do |key, value|
      code = code(key)
      product = find_product(code)
      next if product.nil?

      quantity = value.to_i
      quantity.times do
        apply_conditions(code, product, quantity)
      end
    end
    calculate_total_price
    @result
  end

  private

  def code(key)
    key.split('_').first
  end

  def find_product(code)
    Product.find_by(code: code)
  end

  def apply_conditions(code, product, quantity)
    case code
    when 'GR1'
      @result << { name: product.name, price: product.price }
      @result << { name: product.name, price: 0 }
    when 'SR1'
      price = quantity >= 3 ? 450 : product.price
      @result << { name: product.name, price: price }
    when 'CF1'
      special_price = ((product.price.to_f / 3) * 2)
      price = quantity >= 3 ? special_price : product.price
      @result << { name: product.name, price: price.round(3) }
    end
  end

  def calculate_total_price
    total_price = @result.map { |product| product[:price] }.sum
    @result << { total_price: total_price.round }
  end
end
