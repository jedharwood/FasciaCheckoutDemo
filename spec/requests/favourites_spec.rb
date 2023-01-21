# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Favourites', type: :request do
  before(:example, populate_favourites: true) do
    @favourites = instantiate_favourite_list(3)
    @favourite = @favourites[0]
  end

  before(:example, populate_materials: true) do
    materials = instantiate_material_list(1)
    @material = materials[0]
  end

  describe 'GET /index' do
    context 'when db contains favourites', populate_favourites: true do
      it 'succeeds' do
        get favourites_path
        expect(response).to be_successful
        expect(response).to render_template(:index)
      end

      it 'renders index template' do
        get favourites_path
        expect(response).to render_template(:index)
      end

      it 'assigns @favourites' do
        get favourites_path
        expect(assigns(:favourites)).to eq(@favourites)
      end
    end

    context 'when db contains no favourites' do
      it 'assigns @favourites as an empty array' do
        get favourites_path
        expect(assigns(:favourites)).to eq([])
      end
    end
  end

  describe 'POST /create' do
    context 'when db contains materials', populate_materials: true do
      it 'turbo stream returns correct information' do
        post favourites_path(material_id: @material.id)
        expect(response).to have_http_status(:ok)
        expect(response.media_type).to eq Mime[:turbo_stream]
        expect(response).to render_template(layout: false)
        expect(response.body).to include(expected_turbo_stream(@material.id))
      end

      it 'increases Favourite count by 1' do
        expect do
          post favourites_path(material_id: @material.id)
        end.to change(Favourite, :count).by(1)
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'when db contains favourites', populate_favourites: true do
      it 'turbo stream returns correct information' do
        delete favourite_path(@favourite)
        expect(response).to have_http_status(:ok)
        expect(response.media_type).to eq Mime[:turbo_stream]
        expect(response).to render_template(layout: false)
        expect(response.body).to include(expected_turbo_stream(@favourite.material_id))
      end

      it 'decreases Favourite count by 1' do
        expect do
          delete favourite_path(@favourite)
        end.to change(Favourite, :count).by(-1)
      end
    end
  end
end

private

def expected_turbo_stream(id)
  favourite_star_id = "favourite_star_#{id}"
  '<turbo-stream action="replace" target="' + favourite_star_id + '"><template><turbo-frame id="' + favourite_star_id + '"'
end
