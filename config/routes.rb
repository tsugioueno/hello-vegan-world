Rails.application.routes.draw do
  get 'articles/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  resources :articles, only: [:index]
  resources :items
  resources :products do
    resources :buyers, only: [:index, :create]
  end
end
