Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies
  resources :plans
  resources :cals
  resources :customers
  resources :policies 
  resources :comments 
  resources :transactions
  resources :policies do
    member do
      post "check_data"		
    end
  end
  resources :policies do
    collection do
      get "cancel_policy"		
    end
  end
  resources :customers do
    member do
      get "surrender"		
    end
  end
  resources :plans do
    member do
      get "list"		
    end
  end
  root 'companies#index'
end
