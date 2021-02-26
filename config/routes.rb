Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show]
  resources :themes do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:edit, :update, :destroy] do
    resources :reviews, only: [:create]
  end
end
