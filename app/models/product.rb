# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :cart_products
  has_many :carts, through: :cart_products

  validates :code, :name, :price, presence: true
end
