Rails.application.routes.draw do

  devise_for :users

  root 'places#index'

  resources :places do
  	resources :events, shallow: true do
  		resources :posts, shallow: true, only:[:create]
  	end
  end

  resources :users, only: [:show]

end
