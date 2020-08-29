Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }

  root 'items#index'

  resources :users
  resources :items, only: [:index, :new, :create]
  resources :cards, only: [:new, :create, :show, :destroy] do
  end
end
