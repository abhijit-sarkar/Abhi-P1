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
      get "doc_list"
    end
  end
  
  resources :policies do
    member do            
      get "send_mail"      
      get "destroy_doc"
    end
  end

  resources :customers do
    member do
      get "surrender"      
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
