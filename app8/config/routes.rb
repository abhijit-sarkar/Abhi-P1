Rails.application.routes.draw do
  
  devise_for :users
  devise_scope :user do
    root to: 'home#index', as: :authenticated_root
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies   
  resources :comments  
  resources :home 
  
  resources :policy_documents do
    member do
      get "list"
      get "doc_list"
    end
  end
  
  resources :policies do
    member do
      get "policy_list"	
      post "policy_details"
      post "policy_view"
      post "check_data"	
      get "cancel_policy"
      get "send_mail"
      get "policy_details"	
    end
  end

  resources :customers do
    member do
      get "surrender"
      get "send_mail"
    end
  end
  
  resources :transactions do
    member do
      get "send_mail"		
    end
  end

  resources :plans do
    member do
      get "list"		
    end
  end
  
  root 'devise/sessions#new'
  
end
