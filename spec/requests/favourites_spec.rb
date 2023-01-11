# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Favourites', type: :request do
  before(:example, populate_favourites: true) do
    @favourites = instantiate_favourite_list(3)
    @favourite = @favourites[0]
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

  describe 'DELETE /destroy' do
    context 'when db contains favourites', populate_favourites: true do
      it 'returns status: found' do
        delete favourites_path(@favourite)
        expect(response.media_type).to eq('text/html')
        expect(response).to have_http_status(:found)
        expect(response.status).to eq(302)
      end

      it 'decreases Favourite count by 1' do
        expect do
          delete favourites_path(@favourite)
        end.to change(Favourite, :count).by(-1)
      end

      it 'shows a success message' do
        delete favourites_path(@favourite)
        expect(flash[:success]).to eq("#{@favourite.material.name} removed from favourites")
      end

      it 'redirects to favourites_path' do
        delete favourites_path(@favourite)
        expect(response).to redirect_to(favourites_path)
      end
    end
  end
end
