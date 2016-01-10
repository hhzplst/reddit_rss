Rails.application.routes.draw do
  
  root 'feeds#index', as:"home"

  get "/signup", to: "users#signup"

  post "/signup", to:"users#create"

  get '/login', to:"users#login", as:"login"

  post "/login", to:"users#attempt_login"

  delete '/logout', to: "users#logout", as:"logout"

  post '/fav', to: "feeds#fav"

  get '/fav', to: "feeds#all_fav"

end
