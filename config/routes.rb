Rails.application.routes.draw do

get "myprofile/:id", to: "users#show", as: "user"
post "event/create", to: "users#create", as: "create_event"

get "events/index", to: "event#index", as: "events"
get "events/show/:id", to: "event#show", as: "event"

devise_for :users
# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
# Defines the root path route ("/")
root "event#index"
end
