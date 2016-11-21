Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :coms
  resources :plans
  resources :cals
  resources :customers
  resources :pols
  resources :choices
  resources :comments
  resources :mains
  resources :via
  root 'mains#index'
end
