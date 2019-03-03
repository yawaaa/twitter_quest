Rails.application.routes.draw do
  root to: "toppages#index"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "/auth/twitter/callback", to: "sessions#create"

  get "rankings", to: "rankings#index"
  get "battle_logs", to: "battle_logs#show"
  # get "battles", to: "battles#show"
  # post "battles", to: "battles#create"

  get "skills", to: "skills#index"
  get "battles/result", to:"battles#show"
  get "signup", to: "users#new"
  resources :users, only: [:show, :new, :create]
  resources :battles, only: [:create, :new]
  resources :skill_learnings, only: [:create]

end
