Rails.application.routes.draw do
  devise_for :users
  get 'admin', to: 'home#index'
  root 'articles#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :articles
  resources :categories
  resources :tags
  resources :comments, only: [:create]
end
