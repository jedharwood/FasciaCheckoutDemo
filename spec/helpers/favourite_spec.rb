# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FavouriteHelper, type: :helper do
  before(:example, populate_material: true) do
    materials = instantiate_material_list(1)
    @material = materials[0]
  end

  before(:example, populate_material_with_favourite: true) do
    materials = instantiate_material_list(1)
    @material = materials[0]
    @favourite = Favourite.create(material_id: @material.id)
  end

  describe 'favourited?' do
    context 'when material is not favourited', populate_material: true do
      it 'returns false' do
        result = favourited?(@material)
        expect(result).to eq(false)
      end
    end

    context 'when material is favourited', populate_material_with_favourite: true do
      it 'returns true' do
        result = favourited?(@material)
        expect(result).to eq(true)
      end
    end
  end

  describe 'get_favourite_id' do
    context 'when material is not favourited', populate_material: true do
      it 'returns empty string' do
        result = get_favourite_id(@material)
        expect(result).to eq('')
      end
    end

    context 'when material is favourited', populate_material_with_favourite: true do
      it 'returns favourite.id' do
        result = get_favourite_id(@material)
        expect(result).to eq(@favourite.id)
      end
    end
  end

  describe 'get_favourite' do
    context 'when material is not favourited', populate_material: true do
      it 'returns nil' do
        result = get_favourite(@material)
        expect(result).to be nil
      end
    end

    context 'when material is favourited', populate_material_with_favourite: true do
      it 'returns favourite' do
        result = get_favourite(@material)
        expect(result).to eq(@favourite)
      end
    end
  end
end
