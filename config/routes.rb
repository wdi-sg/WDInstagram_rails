Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'articles#index'

  # photos/gif routes
  get '/articles/new' => 'articles#new', as: 'new_article'
  post '/articles' => 'articles#create'
  get '/articles/:id' => 'articles#show' , as: 'article'
  get '/articles/:id/edit' => 'articles#edit', as: 'edit_article'
  patch '/articles/:id' => 'articles#update'
  delete '/articles/:id' => 'articles#destroy'
  get '/sort' => 'articles#sort'

  # Video routes
  get '/videos/new' => 'videos#new', as: 'new_video'
  post '/videos' => 'videos#create'
  get '/videos/:id' => 'videos#show' , as: 'video'
  get '/videos/:id/edit' => 'videos#edit', as: 'edit_video'
  patch '/videos/:id' => 'videos#update'
  delete '/videos/:id' => 'videos#destroy'


end