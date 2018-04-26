# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  namespace :providers do
    resources :containers do
      resources :users
    end
  end

  namespace :customers do
    resources :containers, only: %i[index show new create] do
      resources :visits, only: %i[index show new create]
      resources :users, only: %i[new create show destroy]
    end
  end
  mount Attachinary::Engine => '/attachinary'
end
