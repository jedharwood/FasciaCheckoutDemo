# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  before(:example, populate_materials: true) do
    @materials = instantiate_material_list(3)
  end

  describe 'GET /index' do
    context 'when db contains materials', populate_materials: true do
      it 'succeeds' do
        get root_path
        expect(response).to be_successful
        expect(response).to render_template(:index)
      end

      it 'renders index template' do
        get root_path
        expect(response).to render_template(:index)
      end

      it 'assigns @materials' do
        get root_path
        expect(assigns(:materials)).to eq(@materials)
      end
    end

    context 'when db contains no materials' do
      it 'assigns @materials as an empty array' do
        get root_path
        expect(assigns(:materials)).to eq([])
      end
    end
  end
end
