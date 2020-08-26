Rails.application.routes.draw do
  resources :attractions
  root "welcome#home"
  
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/session', to: 'sessions#create', as: 'session'
  delete '/session/', to: 'sessions#destroy'
  resources :users
  post '/rides', to:"rides#create", as: 'rides'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
