# frozen_string_literal: true

class FavouritesController < ApplicationController
  def index
    @favourites = Favourite.all.includes(:material).order('materials.name')
  end

  def create
    favourite = Favourite.create!(favourite_params)

    render turbo_stream: turbo_stream.replace("favourite_star_#{favourite.material_id}", partial: 'layouts/favourite_star',
                                                                                         locals: { favourited: true, favourite:, material: favourite.material })
  end

  def destroy
    favourite = Favourite.find(params[:id])
    favourite.destroy

    render turbo_stream: turbo_stream.replace("favourite_star_#{favourite.material_id}", partial: 'layouts/favourite_star',
                                                                                         locals: { favourited: false, favourite:, material: favourite.material })
  end

  private

  def favourite_params
    params.permit(:material_id)
  end
end
