Rails.application.routes.draw do
  root 'posts#index'

  # routing for posts #
  get '/posts/new', to: 'posts#new', as: 'new_post'
  get '/posts/:id', to: 'posts#show' , as: 'post'
  get '/posts/:id/edit', to: 'posts#edit', as: 'edit_post'

  patch '/posts/:id', to: 'posts#update'
  post '/posts', to: 'posts#create'
  delete '/posts/:id', to: 'posts#destroy'

  # routing for videos #
  get '/videos/new', to: 'videos#new', as: 'new_video'
  get '/videos/:id', to: 'videos#show' , as: 'video'
  get '/videos/:id/edit', to: 'videos#edit', as: 'edit_video'

  patch '/videos/:id', to: 'videos#update'
  post '/videos', to: 'videos#create'
  delete '/videos/:id', to: 'videos#destroy'

end