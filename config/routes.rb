Rails.application.routes.draw do
  root 'posts#index'

  # routing for posts #
  get '/posts/new' => 'posts#new', as: 'new_post'
  get '/posts/:id' => 'posts#show' , as: 'post'
  get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'

  patch '/posts/:id' => 'posts#update'
  post '/posts' => 'posts#create'
  delete '/posts/:id' => 'posts#destroy'

  # routing for videos #
  get '/videos/new' => 'videos#new', as: 'new_video'
  get '/videos/:id' => 'videos#show' , as: 'video'
  get '/videos/:id/edit' => 'videos#edit', as: 'edit_video'

  patch '/videos/:id' => 'videos#update'
  post '/videos' => 'videos#create'
  delete '/videos/:id' => 'videos#destroy'

  # routing for texts #
  get '/texts/new' => 'texts#new', as: 'new_text'
  get '/texts/:id' => 'texts#show' , as: 'text'
  get '/texts/:id/edit' => 'texts#edit', as: 'edit_text'

  patch '/texts/:id' => 'texts#update'
  post '/texts' => 'texts#create'
  delete '/texts/:id' => 'texts#destroy'

end