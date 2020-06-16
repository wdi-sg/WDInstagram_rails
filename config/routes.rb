Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :posts

  get '/posts/:id' => 'posts#show'

  get '/posts/new' => 'posts#new'
  post '/posts/test' => 'posts#create'

  get '/posts/:id/edit' => 'posts#edit'
  patch '/posts/:id' => 'posts#update'

end