# frozen_string_literal: true

class BasketController < ApplicationController
    def index
        @basket_materials = BasketMaterial.all.includes(:material).order('materials.name')
    end

    def destroy
        basket_material = BasketMaterial.find(params[:id])
        basket_material.destroy
    
        respond_to do |format|
            format.html do
              flash[:success] = "#{basket_material.material.name} removed from basket"
              redirect_to basket_index_path
            end
          end
      end
end
