Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'insta#index'
  get '/post/new' => 'insta#new', as: 'new_post'
  post '/post' => 'insta#create', as: 'post'

end
