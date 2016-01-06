Rails.application.routes.draw do
  
  root 'feeds#index'
  get '/fav' => 'feeds#fav'

end
