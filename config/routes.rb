Rails.application.routes.draw do
  root 'books#index'

  ActiveAdmin.routes(self)

  resources :authors
  resources :books
end
