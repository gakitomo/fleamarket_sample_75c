Rails.application.routes.draw do
  get 'create/Categories'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
  } 

  devise_scope :user do
    get 'address', to: 'users/registrations#new_address'
    post 'address', to: 'users/registrations#create_address'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'items#index'

  resources :items ,:purchase do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end

  resources :users do
  end
  resources :cards, only: [:index, :new, :create, :show, :destroy] do
  end
  

end
