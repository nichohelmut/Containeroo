Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create] do
    resources :visits, only: [:index, :show, :new, :create]
    resources :containers
  end
  resources :containers, only: [:index, :show] do
    resources :visits, only: [:index, :show, :new, :create]
  end

end
