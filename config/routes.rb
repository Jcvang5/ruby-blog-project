# frozen_string_literal: true

Rails.application.routes.draw do
  get 'donations/new'
  get 'donations/create'
  # root 'articles#index'
  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'categories#index'
  resources :categories do
    resources :articles do
      resources :comments
    end
  end
  resources :donations, only: %i[new create]
end
