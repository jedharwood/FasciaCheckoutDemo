# frozen_string_literal: true

Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'home#index'

  namespace :api do
    resources :favourites, only: %i[create destroy]
    resources :basket, only: :create
  end

  resources :favourites, only: :index
  delete 'favourites.:id', to: 'favourites#destroy' # This route is wierd

  resources :material, only: :show
end
