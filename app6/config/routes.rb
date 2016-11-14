Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles
	resources :plans	
	resources :customers
	resources :pols
	resources :mains
	resources :comments
	resources :buys
	root 'mains#index'
end
