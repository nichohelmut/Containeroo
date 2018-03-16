Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :providers do
    resources :containers do
      resources :users
    end
  end
  #resources :containers, only: [:new, :create,:index, :show]
  namespace :customer do
    resources :containers, only: [:index, :show]
    resources :visits do
      resources :users, only: [:new, :create]
    end
  end
end
