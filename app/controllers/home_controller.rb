# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @materials = Material.all.order(:name)
  end
end
