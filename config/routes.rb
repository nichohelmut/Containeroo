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
    resources :containers, only: [:index, :show, :new, :create] do
      resources :visits, only: [:index, :show, :new,:create]
      resources :users, only: [:new, :create, :show, :destroy]
  end
end
  #resources :containers, only: [:new, :create,:index, :show]

end
