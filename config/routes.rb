Rails.application.routes.draw do
  get "users/index", to: "users#index", as: "users"
  get "users/:id", to: "users#show", as: "user"
  get "event/index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "event#index"
end
