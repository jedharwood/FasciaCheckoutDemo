# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::BasketMaterial', type: :request do
  before(:example, populate_material: true) do
    materials = instantiate_material_list(1)
    @material = materials[0]
  end

  let(:headers) do
    { 'ACCEPT' => 'application/json' }
  end

  describe 'POST create' do
    context 'when db contains materials', populate_material: true do
      let(:params) do
        {
          material_id: @material.id,
          length: 2
        }
      end

      it 'creates a new basket_material' do
        expect do
          post(api_basket_index_path, params:, headers:)
        end.to change(BasketMaterial, :count).by(1)
        expect(response.status).to eq 201
      end
    end
  end
end
