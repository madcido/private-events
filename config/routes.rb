Rails.application.routes.draw do

  root "events#index"

  get "/login", to: "users#new"
  post "/login", to: "users#create"
  delete "/logout", to: "users#destroy"

  resources :user, only: [:show]

end
