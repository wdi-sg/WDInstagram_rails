Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #HOME PAGE
  root 'posts#index'
  #CREATE A NEW POST
  get '/posts/new' => 'posts#new', as: 'new_post'
  post '/posts' => 'posts#create'
  #SHOW SINGLE POST
  get '/posts/:id' => 'posts#show' , as: 'post'
  #EDIT A POST
  get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'
  patch '/posts/:id' => 'posts#update'
  #DELETE A POST
  delete '/posts/:id' => 'posts#destroy'
end