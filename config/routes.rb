Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments, only: [:edit, :create, :update, :destroy]
    # resources :tags
  end

  resources :tags, only: [:index, :show]

  root 'posts#index'

end
