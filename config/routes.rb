

Rails.application.routes.draw do

  root 'posts#index', as: 'home'
  get '/posts' => 'posts#index', as: 'all_posts'
  get '/posts/new' => 'posts#new', as: 'new_posts'
  post '/posts' => 'posts#create'
  get '/posts/:id' => 'posts#show' , as: 'post'
  get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'
  patch '/posts/:id' => 'posts#update'
  delete '/posts/:id' => 'posts#destroy'

end