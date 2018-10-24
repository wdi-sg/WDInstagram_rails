Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :entries do
    resources :comments
  end

  resources :entries do
    resources :hashtags
  end

  resources :hashtags do
    resources :entries
  end

  resources :comments

  root to: 'entries#index'
end
