# frozen_string_literal: true

class CartsController < ApplicationController
  def new
    @cart = CartService.new(cart_params).call
  end

  private

  def cart_params
    params.permit(products: {})
  end
end
