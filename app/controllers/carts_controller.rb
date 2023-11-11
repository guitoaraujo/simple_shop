class CartsController < ApplicationController
  def new
    @cart = CartService.new(cart_params).call
  end

  def create
    # cart = Cart.new(cart_params)
  end

  private

  def cart_params
    params.permit(products: {})
  end
end
