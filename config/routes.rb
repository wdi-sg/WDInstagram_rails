Rails.application.routes.draw do
  get 'welcome/index'

  resources :posts

  get 'posts/new'

  root 'welcome#index'
end