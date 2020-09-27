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


  resources :items do
    

    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end

    member do
      get 'purchase', to: 'items/purchase'
      post 'pay', to: 'items/pay'
      get 'done', to: 'items/done'

    end
  end

  resources :users do
  end
  resources :cards, only: [:index, :new, :create, :show, :destroy] do
  end
  

end
