# config/routes.rb
Rails.application.routes.draw do
  resources :todos do
    resources :items
  end

  resources :users

  get 'users', to: 'users#index'
  post 'signup', to: 'users#create'
  

  # Authentication
  post 'auth/login', to: 'authentication#authenticate'
end