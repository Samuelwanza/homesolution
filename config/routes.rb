Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  namespace :owner do
    resources :dashboard, only: [:index]
    resources :properties, only: [:new, :create, :show, :destroy]
    resources :houses, only: [:destroy]
  end
  
  namespace :tenant do
    resources :dashboard, only: [:index]
  end
  
  namespace :admin do
    resources :dashboard, only: [:index]
  end
  

  # Defines the root path route ("/")
  # root "posts#index"
  root "home#index"

end
