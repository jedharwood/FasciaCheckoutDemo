# frozen_string_literal: true

module Api
  class FavouritesController < ApplicationController
    protect_from_forgery with: :null_session

    def create
      favourite = Favourite.create!(favourite_params)

      respond_to do |format|
        format.json do
          render json: serialize_favourite(favourite), status: :created
        end
      end
    end

    def destroy
      favourite = Favourite.find(params[:id])
      favourite.destroy!

      respond_to do |format|
        format.json do
          render json: serialize_favourite(favourite), status: 204
        end
      end
    end

    private

    def favourite_params
      params.permit(:material_id)
    end

    def serialize_favourite(favourite)
      FavouriteSerializer.new(favourite).serializable_hash[:data].to_json
    end
  end
end
