# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Baskets', type: :request do
  before(:example, populate_basket: true) do
    materials = instantiate_material_list(1)
    @basket_materials = instantiate_basket_material_list(3, materials)
    @basket_material = @basket_materials[0]
  end

  describe 'GET /index' do
    context 'when basket is populated', populate_basket: true do
      it 'succeeds' do
        get basket_index_path
        expect(response).to be_successful
        expect(response).to render_template(:index)
      end

      it 'renders index template' do
        get basket_index_path
        expect(response).to render_template(:index)
      end

      it 'assigns @basket_materials' do
        get basket_index_path
        expect(assigns(:basket_materials)).to eq(@basket_materials)
      end
    end

    context 'when basket is empty' do
      it 'assigns @favourites as an empty array' do
        get basket_index_path
        expect(assigns(:basket_materials)).to eq([])
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'when basket is populated', populate_basket: true do
      it 'returns status: found' do
        delete basket_index_path(@basket_material)
        expect(response.media_type).to eq('text/html')
        expect(response).to have_http_status(:found)
        expect(response.status).to eq(302)
      end

      it 'decreases BasketMaterial count by 1' do
        expect do
          delete basket_index_path(@basket_material)
        end.to change(BasketMaterial, :count).by(-1)
      end

      it 'shows a success message' do
        delete basket_index_path(@basket_material)
        expect(flash[:success]).to eq("#{@basket_material.material.name} removed from basket")
      end

      it 'redirects to basket_index_path' do
        delete basket_index_path(@basket_material)
        expect(response).to redirect_to(basket_index_path)
      end
    end
  end
end
