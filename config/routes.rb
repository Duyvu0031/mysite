Rails.application.routes.draw do
  resources :products do
    resources :subscribers, only: [:create]
    resource :unsubscribe, only: [:show]
  end
  
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout' 
 

  
  resource :session
  resources :passwords, param: :token

  get "up" => "rails/health#show", as: :rails_health_check

  root "products#index"
end
