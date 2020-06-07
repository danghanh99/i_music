Rails.application.routes.draw do
  get 'categories/new'
  get 'categories/create'
  root "users#home"
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :categories
end
