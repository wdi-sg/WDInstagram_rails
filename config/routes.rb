Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'

  # Create - Post
  get '/posts/new' => 'posts#new', as: 'new_post'
  post '/posts' => 'posts#create'

  # Show - Post
  get '/posts/:id' => 'posts#show' , as: 'post'

  # Edit - Post
  get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'
  patch '/posts/:id' => 'posts#update'

  # Delete  - Post
  delete '/posts/:id' => 'posts#destroy'


   # Create - Video
   get '/videos/new' => 'videos#new', as: 'new_video'
   post '/videos' => 'videos#create'
 
   # Show - Video
   get '/videos/:id' => 'videos#show' , as: 'video'
 
   # Edit - Video
   get '/videos/:id/edit' => 'videos#edit', as: 'edit_video'
   patch '/videos/:id' => 'videos#update'
 
   # Delete  - Video
   delete '/videos/:id' => 'videos#destroy'
end
