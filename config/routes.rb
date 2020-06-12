Rails.application.routes.draw do
  root "users#home"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :categories
  resources :songs
  resources :albums
  resources :album_songs
end
