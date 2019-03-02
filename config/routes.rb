Rails.application.routes.draw do

  root to: "toppages#index"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"


  get "/auth/:provider/callback", to: "sessions#create"
  get "/auth/twitter/callback", to: "sessions#create"

  get "battles/"


  get "signup", to: "users#new"
  resources :users, only: [:show, :new, :create]

end
