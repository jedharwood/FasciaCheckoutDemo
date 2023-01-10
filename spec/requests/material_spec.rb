require 'rails_helper'

RSpec.describe "Materials", type: :request do
  before(:example, populate_materials: true) do
    materials = instantiate_material_list(2)
    @material = materials[0]
  end

  describe 'GET /show' do
    context 'when db contains materials', populate_materials: true do
      it 'succeeds' do
        get material_path(@material)
        expect(response).to be_successful
        expect(response.status).to eq(200)
      end

      it 'assigns @material' do
        get material_path(@material)
        expect(assigns(:material)).to eq(@material)
      end

      it 'renders show template' do
        get material_path(@material)
        expect(response).to render_template(:show)
      end
    end
  end
end
