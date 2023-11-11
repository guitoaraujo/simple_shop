# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    code { 'GR1' }
    name  { 'Green Tea' }
    price { 311 }
  end
end
