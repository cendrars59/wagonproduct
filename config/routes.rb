Rails.application.routes.draw do
  root to: 'pages#home'

  get "/team" => "pages#team"
  get "/contact" => "pages#join_us"


  # Routes related to products
  get "/products" => "products#index"
  get "/products/:id" => "products#show"


  # Routes related to users
  get "/users" => "users#index"


  # Routes telex
  get "/telex" => "telex#index"
  get "/telex/:id" => "telex#show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
