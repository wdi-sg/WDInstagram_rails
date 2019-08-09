Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'instagrams#index'
  get '/instagrams/new' => 'instagrams#new', as: 'new_instagram'
  post '/instagrams' => 'instagrams#create'
  get '/instagrams/:id' => 'instagrams#show' , as: 'instagram'


end