Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'posts/new' => 'posts#new', as: 'new_post'
  get 'posts/:id/edit' => 'posts#edit', as: 'edit_post'
    get 'posts/:id' => 'posts#show', as: "post"
    patch 'posts/:id' => 'posts#update'
    post '/posts' => 'posts#create'

  root 'posts#index'
end
