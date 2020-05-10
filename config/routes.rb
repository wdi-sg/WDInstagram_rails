Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'instagrams#index'

  get '/instagrams/new' => 'instagrams#new', as: 'new_instagrams'

  post '/instagrams' => 'instagrams#create'

  get '/instagrams/:id' => 'instagrams#show' , as: 'show_instagram'

  get '/instagrams/:id/edit' => 'instagrams#edit', as: 'edit_instagrams'

  patch '/instagrams/:id' => 'instagrams#update'

  delete '/instagrams/:id' => 'instagrams#destroy'
end