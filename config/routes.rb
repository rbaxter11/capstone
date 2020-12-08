Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post "/sessions" => "sessions#create"

    get "/users" => "users#index"
    get "/users" => "users#new"
    get "/users/:id" => "users#show"
    post "/users" => "users#create"
    get "/users/:id" => "users#edit"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"

    get "/games" => "games#index"
    get "/games" => "games#new"
    get "/games/:id" => "games#show"
    post "/games" => "games#create"
    get "/games/:id" => "games#edit"
    patch "/games/:id" => "games#update"
    delete "/games/:id" => "games#destroy"

    get "/meetups" => "meetups#index"
    get "/meetups" => "meetups#new"
    get "/meetups/:id" => "meetups#show"
    post "/meetups" => "meetups#create"
    get "/meetups/:id" => "meetups#edit"
    patch "/meetups/:id" => "meetups#update"
    delete "/meetups/:id" => "meetups#destroy"
  end
end
