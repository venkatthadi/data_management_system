Rails.application.routes.draw do
  resources :users
  resources :usertypes
  resources :schools
  resources :networks
  resources :accounts
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
