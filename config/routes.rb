Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #display all posts
  root 'posts#index'

  #create new post
  get '/posts/new' => 'posts#new', as: 'new_post'
  post '/posts' => 'posts#create'

  #show each individual post
  get '/posts/:id' => 'posts#show', as: 'post'

  #edit a post
  get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'
  patch '/posts/:id' => 'posts#update'

  #delete a post
  delete '/posts/:id' => 'posts#destroy'
end
