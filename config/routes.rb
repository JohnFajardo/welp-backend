Rails.application.routes.draw do

  Rails.application.routes.default_url_options[:host] = "http://localhost:3000"

  get '/locations/:location_id/reviews/:user_id', to: 'reviews#index'
  get '/locations/:lat/:lng', to: 'locations#index', lat: /[^\/]+/, lng: /[^\/]+/
  get '/locations/:location_id', to: 'locations#show'
  post '/locations', to: 'locations#create'
  
  post '/likes', to: 'likes#create'
  delete '/likes/:review_id/:user_id', to: 'likes#destroy'
  post '/reviews', to: 'reviews#create'
  post '/login', to: 'auth#login'
  post '/signup', to: 'users#create'
  post '/profile', to: 'users#profile'
  patch '/profile/:id', to: 'users#update'
end