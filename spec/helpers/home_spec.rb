# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeHelper, type: :helper do
  before(:example, populate_material: true) do
    @material = Material.create(name: 'Test material', description: 'Test material description', thickness: 1.1,
                                width: 2.2)
    @material.image.attach(io: File.open(Rails.root.join('db', 'sample', 'images', 'door_trim_0.webp')),
                           filename: @material.name)
  end

  before(:example, populate_material_with_favourite: true) do
    @material = Material.create(name: 'Test material', description: 'Test material description', thickness: 1.1,
                               width: 2.2)
    @material.image.attach(io: File.open(Rails.root.join('db', 'sample', 'images', 'door_trim_0.webp')),
                          filename: @material.name)
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
end
