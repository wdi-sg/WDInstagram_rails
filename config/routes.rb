# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  resources :logins
  resources :users
  resources :registers

  root 'posts#index'
end
