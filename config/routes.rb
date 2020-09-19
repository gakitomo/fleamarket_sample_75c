Rails.application.routes.draw do
  get 'create/Categories'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  } 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'items#index'

  resources :items, only:[:index, :new, :show, :edit, :destroy]
  resources :items ,:purchase do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :users do
  end
  resources :cards, only: [:index, :new, :create, :show, :destroy] do
  end
  

end
