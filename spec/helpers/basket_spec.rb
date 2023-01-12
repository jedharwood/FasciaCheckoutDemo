# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BasketHelper, type: :helper do
  before(:example, populate_basket: true) do
    @material_price = 10
    @material_length = 1
    @number_of_items_in_basket = 3

    materials = instantiate_material_list(1, @material_price)
    @basket_materials = instantiate_basket_material_list(@number_of_items_in_basket, materials)
  end

  before(:example, empty_basket: true) do
    @basket_materials = []
  end

  describe 'calculate_material_cost' do
    it 'returns price * length' do
      result = calculate_material_cost(10, 20)
      expect(result).to eq(200)
    end
  end

  describe 'calculate_basket_total' do
    context 'when basket is populated', populate_basket: true do
      it 'returns total of price * length for each material in the basket' do
        expected = @number_of_items_in_basket * (Money.new(@material_price) * @material_length)
        result = calculate_basket_total(@basket_materials)
        expect(result).to eq(expected)
      end
    end

    context 'when basket is empty', empty_basket: true do
      it 'returns 0' do
        result = calculate_basket_total(@basket_materials)
        expect(result).to eq(0)
      end
    end
  end

  describe 'basket_populated?' do
    context 'when basket is populated', populate_basket: true do
      it 'returns true' do
        result = basket_populated?
        expect(result).to eq(true)
      end
    end

    context 'when basket is empty', empty_basket: true do
      it 'returns false' do
        result = basket_populated?
        expect(result).to eq(false)
      end
    end
  end

  describe 'number_of_items_in_basket' do
    context 'when basket is populated', populate_basket: true do
      it 'returns total number of materials in the basket' do
        result = number_of_items_in_basket
        expect(result).to eq(@number_of_items_in_basket)
      end
    end

    context 'when basket is empty', empty_basket: true do
      it 'returns 0' do
        result = number_of_items_in_basket
        expect(result).to eq(0)
      end
    end
  end
end
