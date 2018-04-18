Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  namespace :providers do
    resources :containers do
      resources :users
    end
  end

  namespace :customers do
    resources :containers, only: [:index, :show, :new, :create] do
      resources :visits, only: [:index, :show, :new,:create]
      resources :users, only: [:new, :create, :show, :destroy]
  end
end
  mount Attachinary::Engine => "/attachinary"
end
