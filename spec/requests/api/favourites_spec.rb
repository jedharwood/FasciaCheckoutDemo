# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Favourites', type: :request do
  before(:example, populate_material: true) do
    @material = Material.create(name: 'Test material', description: 'Test material description', thickness: 1.1,
                                width: 2.2)
    @material.image.attach(io: File.open(Rails.root.join('db', 'sample', 'images', 'door_trim_0.webp')),
                           filename: @material.name)
  end

  before(:example, populate_material_with_favourite: true) do
    material = Material.create(name: 'Test material', description: 'Test material description', thickness: 1.1,
                               width: 2.2)
    material.image.attach(io: File.open(Rails.root.join('db', 'sample', 'images', 'door_trim_0.webp')),
                          filename: material.name)
    @favourite = Favourite.create(material_id: material.id)
  end

  let(:headers) do
    { 'ACCEPT' => 'application/json' }
  end

  describe 'POST create' do
    context 'when db contains materials', populate_material: true do
      let(:params) do
        {
          material_id: @material.id
        }
      end

      it 'creates a new favourite' do
        expect do
          post(api_favourites_path, params:, headers:)
        end.to change(Favourite, :count).by(1)
        expect(response.status).to eq 201
      end
    end
  end

  describe 'DELETE destroy' do
    context 'when db contains materials', populate_material_with_favourite: true do
      it 'deletes a favourite' do
        expect do
          delete(api_favourite_path(@favourite), headers:)
        end.to change(Favourite, :count).by(-1)
        expect(response.status).to eq 204
      end
    end
  end
end
