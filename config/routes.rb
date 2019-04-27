Rails.application.routes.draw do

  root 'posts#index'

  get 'posts/new' => 'posts#new', as: 'new_post'

  post 'posts' => 'posts#create'

  get 'posts/:id' => 'posts#show', as: 'show_post'

  get 'posts' => 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end