Rails.application.routes.draw do
  get '/login', to: 'authentication#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:index]
  resources :rides

  root 'home#index'
end
