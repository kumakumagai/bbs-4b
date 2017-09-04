Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :articles
  resources :categories
  resources :tags
  resources :comments
end
