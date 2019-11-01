Rails.application.routes.draw do



  get '/posts/new' => 'posts#new', as: 'new_post'

  get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'

  get '/posts/:id' => 'posts#show' , as: 'post'

  post '/posts' => 'posts#create'

  root 'posts#index'

end