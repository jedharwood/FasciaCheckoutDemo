# frozen_string_literal: true

module FavouriteHelper
  def favourited?(params)
    favourite = Favourite.find_by(material_id: params[:id])
    favourite.nil? ? false : true
  end

  def get_favourite_id(params)
    favourite = Favourite.find_by(material_id: params[:id])
    favourite.nil? ? '' : favourite.id
  end

  def get_favourite(params)
    Favourite.find_by(material_id: params[:id])
  end
end
