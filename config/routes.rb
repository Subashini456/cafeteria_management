Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/", to: "home#index"
  resources :menus
  resources :users
  resources :orderfoods
  resources :orders
  get "/allorders" => "orders#show", as: :new_allorder
  get "/cards" => "orderfoods#show", as: :new_card
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
