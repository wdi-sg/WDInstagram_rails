Rails.application.routes.draw do

  devise_for :users
  resources :wdinstagrams do
    resources :comments
end

  resources :wdinstagrams do
  resources :tags
end

  resources :tags do
  resources :wdinstagrams
end
  resources :comments
  root'wdinstagrams#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
