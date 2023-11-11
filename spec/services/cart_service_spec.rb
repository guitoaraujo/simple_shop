# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartService do
  subject { described_class.new(params).call }

  let!(:green_tea) { create(:product) }
  let!(:strawberry) { create(:product, code: 'SR1', name: 'Strawberries', price: 500) }
  let!(:coffee) { create(:product, code: 'CF1', name: 'Coffee', price: 1123) }
  let(:cart1) do
    {
      products: {
        'GR1_quantity' => 1
      }
    }
  end
  let(:cart2) do
    {
      products: {
        'GR1_quantity' => 1,
        'SR1_quantity' => 3
      }
    }
  end
  let(:cart3) do
    {
      products: {
        'GR1_quantity' => 1,
        'SR1_quantity' => 1,
        'CF1_quantity' => 3
      }
    }
  end

  context 'Special Conditions' do
    context 'cart1' do
      let(:params) { cart1 }
      let(:expected_response) do
        [
          {
            name: 'Green Tea',
            price: 311
          },
          {
            name: 'Green Tea',
            price: 0
          },
          { total_price: 311 }
        ]
      end

      it 'applies special conditions' do
        expect(subject).to eq(expected_response)
      end
    end

    context 'cart2' do
      let(:params) { cart2 }
      let(:expected_response) do
        [
          {
            name: 'Green Tea',
            price: 311
          },
          {
            name: 'Green Tea',
            price: 0
          },
          {
            name: 'Strawberries',
            price: 450
          },
          {
            name: 'Strawberries',
            price: 450
          },
          {
            name: 'Strawberries',
            price: 450
          },
          { total_price: 1661 }
        ]
      end

      it 'applies special conditions' do
        expect(subject).to eq(expected_response)
      end
    end

    context 'cart3' do
      let(:params) { cart3 }
      let(:expected_response) do
        [
          {
            name: 'Green Tea',
            price: 311
          },
          {
            name: 'Green Tea',
            price: 0
          },
          { name: 'Strawberries',
            price: 500 },
          {
            name: 'Coffee',
            price: 748.667
          },
          {
            name: 'Coffee',
            price: 748.667
          },
          {
            name: 'Coffee',
            price: 748.667
          },
          { total_price: 3057 }
        ]
      end

      it 'applies special conditions' do
        expect(subject).to eq(expected_response)
      end
    end
  end
end
