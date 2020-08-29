Rails.application.routes.draw do
  # get 'card/new'
  # get 'card/show'
  devise_for :users

  root 'items#index'

  resources :users

  resources :cards, only: [:new, :create] do
  end
end
