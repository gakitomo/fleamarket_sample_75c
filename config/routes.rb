Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  get    '/sign_in',   to: 'sessions#new'
  post   '/sign_in',   to: 'sessions#create'
  delete '/sign_out',  to: 'sessions#destroy'

  root 'items#index'

  resources :users
  resources :items, only: [:index, :new, :create]
  resources :cards, only: [:new, :create, :show, :destroy] do
  end
end
