Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  } 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'items#index'

  resources :users
  resources :items, only: [:index, :new, :create, :show]
  resources :cards, only: [:index, :new, :create, :show, :destroy] do
  end
  

end
