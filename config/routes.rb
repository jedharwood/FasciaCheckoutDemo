# frozen_string_literal: true

Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'home#index'

  namespace :api do
    resources :favourites, only: %i[create destroy]
  end
end
