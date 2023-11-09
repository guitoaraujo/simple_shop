class Product < ApplicationRecord
  validates :code, :name, :price, presence: true
end
