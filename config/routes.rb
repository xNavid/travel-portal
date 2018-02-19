Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  #trips
  resources :trips
  # users
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  #
  get 'managers/signup', to: 'managers#new'
  resources :managers, except: [:new]
end
