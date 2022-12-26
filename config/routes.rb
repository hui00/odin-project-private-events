Rails.application.routes.draw do

# get "users/index", to: "users#index", as: "users"
get "myprofile/:id", to: "users#show", as: "user"
post "event/create", to: "event#create", as: "create_event"

devise_for :users
# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
# Defines the root path route ("/")
root "event#index"
end
