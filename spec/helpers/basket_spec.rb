# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BasketHelper, type: :helper do
  before(:example, populate_basket: true) do
    @material_price = 10
    @material_length = 1
    @items_in_cart = 3

    materials = instantiate_material_list(1, @material_price)
    
    @basket_materials = []
    @items_in_cart.times do |i| 
        @basket_materials << BasketMaterial.create(material_id: materials[0].id, length: @material_length)
    end
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
            expected = @items_in_cart * (Money.new(@material_price) * @material_length)
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
end
