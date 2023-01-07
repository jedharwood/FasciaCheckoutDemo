# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Favourites', type: :request do
  before(:example, populate_material: true) do
    materials = instantiate_material_list(1)
    @material = materials[0]
  end

  before(:example, populate_material_with_favourite: true) do
    materials = instantiate_material_list(1)
    favourites = instantiate_favourite_list(materials)
    @favourite = favourites[0]
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
