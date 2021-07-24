Rails.application.routes.draw do
  root to: 'posts#all'
  
  #session routes
  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'
  get '/profil', to:'users#edit', as: :profil
  patch '/profil', to: 'users#update'
  get '/favorites', to: 'posts#favorites', as: :favorites

  #register routes
  get '/register', to: 'users#new', as: :register
  post '/register', to: 'users#create'

  resources :users, only: [:new] do
    member do
      get 'confirm'
    end
  end
  resources :sessions, only: [:new, :destroy]
  resources :posts do
    member do 
      get 'to_favorite', to: 'posts#to_favorite'
    end
  end
end
