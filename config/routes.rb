# frozen_string_literal: true

Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'home#index'

  namespace :api do
    resources :favourites, only: %i[create destroy]
    resources :basket, only: :create
  end

  resources :favourites, only: :index
  delete 'favourites.:id', to: 'favourites#destroy'

  resources :material, only: :show

  resources :basket, only: :index
  delete 'basket.:id', to: 'basket#destroy'
end
