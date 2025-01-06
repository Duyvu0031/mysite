Rails.application.routes.draw do
 # Đăng nhập và quản lý phiên
 resource :session, only: [:new, :create, :destroy]
 # Đăng ký người dùng
 resources :users, only: [:new, :create]
 # Quản lý mật khẩu
 resources :passwords, param: :token, only: %i[new create edit update]
 

 # Quản lý sản phẩm
 resources :products do
  resources :subscribers, only: [:create]
  resource :unsubscribe, only: [:show]
end
  
  get "/products", to: "products#index"

  get "/products/new", to: "products#new"
  post "/products", to: "products#create"

  get "/products/:id", to: "products#show"

  get "/products/:id/edit", to: "products#edit"
  patch "/products/:id", to: "products#update"
  put "/products/:id", to: "products#update"

  delete "/products/:id", to: "products#destroy"

  get "up" => "rails/health#show", as: :rails_health_check



  root "products#index"
  
end
