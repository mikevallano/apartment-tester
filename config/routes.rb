Rails.application.routes.draw do

  devise_for :users
  resources :accounts
  resources :roles

  root 'pages#home'

  get 'pages/about'


end
