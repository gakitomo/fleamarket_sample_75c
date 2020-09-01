Rails.application.routes.draw do
  devise_for :users, controllers:{
    # registrations: 'users/registrations',
    # sessions: 'users/sessions'
  }
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
  # get    '/sign_in',   to: 'sessions#new'
  # post   '/sign_in',   to: 'sessions#create'
  # delete '/sign_out',  to: 'sessions#destroy'

  root 'items#index'

  resources :users
  resources :items, only: [:index, :new, :create]
  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
end
