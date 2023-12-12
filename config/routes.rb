Rails.application.routes.draw do
  get 'reviews/create'
  get 'reviews/destroy'
  get '/search', to: 'products#search', as: 'search'
  # get 'orders/index'
  # get 'orders/show'
  # get 'orders/new'
  # get 'orders/create'
  # get 'orders/update'

  resources :products do
    member do
      post 'favorite'
      delete 'unfavorite'
    end
  end

  resources :users do
    member do
      get 'show_favorites', as: 'show_favorites'
    end
  end

  resource :cart, only: [:show] do
    post 'add_to_cart/:product_id', action: :add_to_cart, on: :member, as: :add_to_cart
    delete 'remove_from_cart/:product_id', action: :remove_from_cart, on: :member, as: :remove_from_cart
  end

  # get '/users/show_favorites', to: 'users#show_favorites', as: :show_favorites

  resources :orders

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  root 'products#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
