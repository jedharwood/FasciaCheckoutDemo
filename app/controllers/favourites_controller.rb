# frozen_string_literal: true

class FavouritesController < ApplicationController
  def index
    @favourites = Favourite.all.includes(:material).order('materials.name')
  end

  def destroy
    favourite = Favourite.find(params[:id])
    favourite.destroy

    respond_to do |format|
      format.html do
        flash[:success] = "#{favourite.material.name} removed from favourites"
        redirect_to favourites_path
      end
    end
  end
end
