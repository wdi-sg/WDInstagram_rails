Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'instagrams#index'
  get '/instagrams/new' => 'instagrams#new', as: 'new_instagram'
  get '/instagrams/new_videos' => 'instagrams#new_videos', as: 'new_instagram_videos'
  post '/instagrams' => 'instagrams#create'
  post '/instagrams/videos' => 'instagrams#create_videos'
  get '/instagrams/:id' => 'instagrams#show' , as: 'instagram'
  get 'instagrams/videos/:id' => 'instagrams#show_video' , as: 'instagram_video'
  get '/instagrams/:id/edit' => 'instagrams#edit', as: 'edit_instagram'
  patch '/instagrams/:id' => 'instagrams#update'
  delete '/instagrams/:id' => 'instagrams#destroy'


end