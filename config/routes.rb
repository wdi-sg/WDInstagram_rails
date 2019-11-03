Rails.application.routes.draw do



  get '/posts/new' => 'posts#new', as: 'new_post'

  get '/posts/asc' => 'posts#asc' , as: 'asc_post'

  get '/posts/desc' => 'posts#desc' , as: 'desc_post'

  get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'

  get '/posts/:id' => 'posts#show' , as: 'post'

  root 'posts#index'

  post '/posts' => 'posts#create'

  patch '/posts/:id' => 'posts#update'

  delete '/posts/:id' => 'posts#destroy'



end