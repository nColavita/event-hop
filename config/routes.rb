Rails.application.routes.draw do

  devise_for :users

  root 'places#index'

  resources :places do
  	resources :events, shallow: true
  end
  resources :users, only: [:show]
end
