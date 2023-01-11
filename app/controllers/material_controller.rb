# frozen_string_literal: true

class MaterialController < ApplicationController
  def show
    @material = Material.find(params[:id])
  end
end
