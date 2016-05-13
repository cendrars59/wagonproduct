Rails.application.routes.draw do


  # Route to manage Attachinary
  mount Attachinary::Engine => "/attachinary"

  # Routes related to the users
  devise_for :users
  resources :users, only: [:index]

  root to: 'pages#home'
  get "/team" => "pages#team"
  get "/contact" => "pages#join_us"


  # Routes related to products
  get "products" => "products#index"
  get "products/:id" => "products#show"


  # Routes related to users management
  resources :categories

  # Routes related to the countries mangement
  resources :countries

  # Routes related to the countries mangement
  resources :groups

  # Routes related to the countries mangement
  resources :markets

  # Routes related to the countries mangement
  resources :profils

  # Routes related to the telex mangement
  resources :posts

  # Routes related to the retailers mangement
  resources :retailers


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
