Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'instagrams#index'
  get '/instagrams/new' => 'instagrams#new', as: 'new_instagram'
  get '/instagrams/new_videos' => 'instagrams#new_videos', as: 'new_instagram_videos'
  get '/instagrams/new_texts' => 'instagrams#new_texts', as: 'new_instagram_texts'
  post '/instagrams' => 'instagrams#create'
  post '/instagrams/videos' => 'instagrams#create_videos'
  post '/instagrams/texts' => 'instagrams#create_text'
  get '/instagrams/:id' => 'instagrams#show' , as: 'instagram'
  get 'instagrams/videos/:id' => 'instagrams#show_video' , as: 'instagram_video'
  get '/instagrams/texts/:id' => 'instagrams#show_text' , as: 'instagram_text'
  get '/instagrams/:id/edit' => 'instagrams#edit', as: 'edit_instagram'
  get '/instagrams/:id/edit_video' => 'instagrams#edit_video', as: 'edit_video_instagram'
  get '/instagrams/:id/edit_text' => 'instagrams#edit_text', as: 'edit_text_instagram'
  patch '/instagrams/:id' => 'instagrams#update'
  patch 'instagrams/videos/:id' => 'instagrams#update_video'
  patch 'instagrams/texts/:id' => 'instagrams#update_text'
  delete '/instagrams/:id' => 'instagrams#destroy'
  delete '/instagrams/videos/:id' => 'instagrams#destroy_video'
  delete '/instagrams/texts/:id' => 'instagrams#destroy_text'


end