Rails.application.routes.draw do

  root 'home#index'

  get 'store_books/add_books', to: 'store_books#add_books'
  post 'store_books/:id/add_stock', to: 'store_books#add_stock'
  post 'store_books/:id/remove_stock', to: 'store_books#remove_stock'

  resources :stores
  resources :store_books
  resources :books
  resources :authors

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
