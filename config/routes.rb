# frozen_string_literal: true

Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'home#index'

  namespace :api do
    resources :basket, only: :create
    get 'basket/basket_material_count', to: 'basket#basket_material_count'
  end

  resources :favourites, only: %i[index create destroy]

  resources :material, only: :show

  resources :basket, only: :index
  resources :basket_materials do
    collection do
      get :update_total_price
    end
  end
  delete 'basket.:id', to: 'basket#destroy'
end
