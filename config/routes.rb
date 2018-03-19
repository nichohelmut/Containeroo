Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :providers do
    resources :containers do
      resources :users
    end
  end

  namespace :customers do
    resources :users do
      resources :visits
    end
  end
  #resources :containers, only: [:new, :create,:index, :show]

end
