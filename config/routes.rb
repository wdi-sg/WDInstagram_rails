Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  get '/posts/new' => 'posts#new', as: 'new_posts'
  post '/posts' => 'posts#create', as:'posts'
  get '/posts/:id' => 'posts#show' , as: 'post'
  get '/posts/:id/edit' => 'posts#edit', as: 'edit_posts'
  patch '/posts/:id' => 'posts#update'
  delete '/posts/:id' => 'posts#destroy'
  # resources :posts
end