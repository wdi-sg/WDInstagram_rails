Rails.application.routes.draw do

  devise_for :users
  root 'articles#index'

  resources :articles do
    resources :comments
  end

  resources :articles do
    resources :hashtags
  end

  resources :hashtags do
    resources :resources
  end

  # resources :articles, :comments, :hashtags
end



