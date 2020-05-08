Rails.application.routes.draw do

#  POSTS
  root 'posts#index'
  get '/posts/new' => 'posts#new', as: 'new_post'
  post '/posts/new' => 'posts#create'
  get '/posts/:id' => 'posts#show' , as: 'post'
  get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'
  patch '/posts/:id' => 'posts#update'
  delete '/posts/:id' => 'posts#destroy'
  get '/posts/sort/:order' => 'posts#sort', as: 'sort_post'

# VIDEOS
  get '/videos/new' => 'videos#new', as: 'new_video'
  post '/videos/new' => 'videos#create_vid'
  get '/videos/:id' => 'videos#show', as: 'video'
  get '/videos/:id/edit' => 'videos#edit', as: 'edit_video'
  patch '/videos/:id' => 'videos#update'
  delete '/videos/:id' => 'videos#destroy'
end
