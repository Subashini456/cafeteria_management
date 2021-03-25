Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/", to: "home#index"
  resources :menus
  resources :users
  resources :order_foods
  resources :orders
  get "/clerks_detail" => "users#show", as: :clerk
  delete "/clerks_detail/:id" => "users#destroy", as: :destroy_clerk
  get "/allorders" => "orders#show", as: :new_allorder
  get "/cards" => "order_foods#show", as: :new_card
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
