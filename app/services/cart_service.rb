# frozen_string_literal: true

class CartService
  include BulkFixedDiscount
  include BulkFlexibleDiscount
  include FreeProduct

  def initialize(params)
    @products = params[:products]
    @result = []
  end

  def call
    @products.each do |key, value|
      code = code(key)
      product = find_product(code)
      next if product.nil?

      calculate_product_price(value, code, product)
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

  def calculate_product_price(value, code, product)
    quantity = value.to_i
    return unless quantity.positive?

    apply_free_product(code, product, quantity)
    quantity.times do
      apply_discounts(code, product, quantity)
    end
  end

  def apply_free_product(code, product, quantity)
    return unless code == 'GR1'

    @result << FreeProduct.calculate(product, quantity)
    @result.flatten!
  end

  def apply_discounts(code, product, quantity)
    case code
    when 'SR1'
      @result << BulkFlexibleDiscount.calculate(product, quantity)
    when 'CF1'
      @result << BulkFixedDiscount.calculate(product, quantity)
    end
  end

  def calculate_total_price
    total_price = @result.map { |product| product[:price] }.sum
    @result << { total_price: total_price.round }
  end
end
