Rails.application.routes.draw do
  get 'posts/index'

  root 'posts#index'

  post 'posts' => 'posts#create'

  get 'posts' => 'posts#index'

  get 'posts/:id' => 'posts#show', as: 'show_post'

  get 'posts/new' => 'posts#new', as: 'new_post'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end