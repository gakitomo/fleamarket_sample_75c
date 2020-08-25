Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  devise_for :users

  root 'items#index'

  resources :items, except: [:show] do
    collection do
      get :search
    end
  end
  
  resources :items do
    scope module: :items do
      resources :cards, only:[:new, :create, :show, :destroy]
    end
    collection do
      get  'done', to:'items#done'
    end
    member do
      get "purchase"
      post "pay"
    end
  end
  resources :users
  
end
