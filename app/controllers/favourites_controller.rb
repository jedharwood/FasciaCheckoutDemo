# frozen_string_literal: true

class FavouritesController < ApplicationController
  def index
    @favourites = Favourite.all.includes(:material).order('materials.name')
  end
end
