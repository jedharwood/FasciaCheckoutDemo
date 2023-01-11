# frozen_string_literal: true

module Api
    class BasketController < ApplicationController
      protect_from_forgery with: :null_session
  
      def create
        basket_material = BasketMaterial.create!(basket_material_params)
  
        respond_to do |format|
          format.json do
            render json: basket_material.to_json, status: :created
          end
        end
      end
  
      private
  
      def basket_material_params
        params.permit(:material_id, :length)
      end
    end
  end