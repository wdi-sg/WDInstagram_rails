Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  get '/posts/new' => 'posts#new', as: 'new_post'
  post '/posts' => 'posts#create'
  get '/posts/:id' => 'posts#show' , as: 'post'
  get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'
  patch '/posts/:id' => 'posts#update'
  delete '/posts/:id' => 'posts#destroy'


  get '/posts/:id/comments' => 'comments#index'
  get '/posts/:id/comments/new' => 'comments#new', as: 'new_comment'
  post '/posts/:id/comments/new' => 'comments#create'

  get '/posts/:id/comments/:id' => 'comment#show'
  get '/posts/:id/comments/:id' => 'comment#edit'
  patch '/posts/:id/comments/:id' => 'comment#update'
  delete '/posts/:id/comments/:id' => 'comment#delete'
end