Rails.application.routes.draw do
  get 'sessions/new'
  get 'login/home'
  resources :users
  resources :usertypes
  resources :schools
  resources :networks
  resources :accounts
  get 'profile', to: 'login#show'
  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
  post 'login', to: 'sessions#create'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
