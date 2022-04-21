Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :rooms, only: [:index, :show,:create]
  resources :messages, only: [:index, :create]
  resources :users, only: [:index, :create, :show,:update]
  resources :chats,only: [:create]
  post '/leave', to: 'chats#leave'
  post '/login', to: 'application#create'
  get '/profile', to: 'users#show'
  mount ActionCable.server => '/cable'
end
