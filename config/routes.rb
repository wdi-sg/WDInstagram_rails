Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :photos do
    resources :comments
    resources :hashtags
  end

  resources :hashtags, only: [:show] do
    resources :photos, only: [:index]
  end

  root 'photos#index'
end