Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post "/sessions" => "sessions#create"

    get "/users" => "users#index"
    get "/users/:id" => "users#show"
    post "/users" => "users#create"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"

    get "/games" => "games#index"
    get "/games/:id" => "games#show"
    post "/games" => "games#create"
    patch "/games/:id" => "games#update"
    delete "/games/:id" => "games#destroy"

    get "/meetups" => "meetups#index"
    get "/meetups/:id" => "meetups#show"
    post "/meetups" => "meetups#create"
    patch "/meetups/:id" => "meetups#update"
    delete "/meetups/:id" => "meetups#destroy"

    get "/game_ownerships" => "game_ownerships#index"
    get "/game_ownerships/:id" => "game_ownerships#show"
    post "/game_ownerships" => "game_ownerships#create"
    patch "/game_ownerships/:id" => "game_ownerships#update"
    delete "/game_ownerships/:id" => "game_ownerships#destroy"

    get "/meetup_invitations" => "meetup_invitations#index"
    get "/meetup_invitations/:id" => "meetup_invitations#show"
    post "/meetup_invitations" => "meetup_invitations#create"
    patch "/meetup_invitations/:id" => "meetup_invitations#update"
    delete "/meetup_invitations/:id" => "meetup_invitations#destroy"
  end
end
