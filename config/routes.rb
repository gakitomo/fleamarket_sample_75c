Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
  } 

  devise_scope :user do
    get 'address', to: 'users/registrations#new_address'
    post 'address', to: 'users/registrations#create_address'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'items#index'

  resources :items, only:[:index, :new, :show]
  resources :users
  

end
