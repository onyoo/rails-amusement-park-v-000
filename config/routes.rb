Rails.application.routes.draw do

  post 'rides/new'
  get 'rides/create'
  post 'rides/create'


  resources :users
  resources :attractions, only: [:index, :show, :edit, :update, :new, :create]


  get 'signin' => 'sessions#new'
  get 'signout' => 'sessions#destroy'
  post 'create' => 'sessions#create'
  root 'application#home'

end