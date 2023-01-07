# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Favourites', type: :request do
  before(:example, populate_favourites: true) do
    materials = instantiate_material_list(3)
    @favourites = instantiate_favourite_list(materials)
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
end
