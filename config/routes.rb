# frozen_string_literal: true

Rails.application.routes.draw do
  root 'articles#index'

  resources :articles do
    resources :comments

    resources :categories do
      resources :articles
    end
  end
end
