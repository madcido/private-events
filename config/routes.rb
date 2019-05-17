Rails.application.routes.draw do

  root "events#index"

  get "/login", to: "users#new"
  post "/login", to: "users#create"
  delete "/logout", to: "users#destroy"

  resources :users, only: [:show]
  resources :events, only: [:show, :create, :index]

end
