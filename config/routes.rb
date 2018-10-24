Rails.application.routes.draw do

  get 'tags/index'
  get 'tags/new'
  get 'tags/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
    resources :comments
  end

  resources :comments

  resources :tags
  
  root 'posts#index'
end
