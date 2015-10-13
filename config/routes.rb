Rails.application.routes.draw do

  devise_for :users

  root 'places#index'
  resources :events 
  resources :places
end
