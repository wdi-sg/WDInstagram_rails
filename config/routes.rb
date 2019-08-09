Rails.application.routes.draw do
  root 'posts#index'
  get '/posts' => 'posts#index', as: 'posts'
  get '/posts/new' => 'posts#new', as: 'new_post'
  get '/posts/:id' => 'posts#show', as: 'post'
  get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'

  post '/posts' => 'posts#create'
  patch '/posts/:id' => 'posts#update'
  delete '/posts/:id' => 'posts#destroy', as: 'destroy_post'

  get '/videos/' => 'videos#index', as: 'videos'
  get '/videos/new' => 'videos#new', as: 'new_video'
  get '/videos/:id' => 'videos#show', as: 'video'
  get '/videos/:id/edit' => 'videos#edit', as: 'edit_video'

  post '/videos' => 'videos#create'
  patch '/videos/:id' => 'videos#update'
  delete '/videos/:id' => 'videos#destroy', as: 'destroy_video'

  post '/videos' => 'videos#create'
end
