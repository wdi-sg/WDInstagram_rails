Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments
    resources :tags
  end

  resources :tags do
    resources :posts
  end

  resources :comments

  root 'posts#index'
end
