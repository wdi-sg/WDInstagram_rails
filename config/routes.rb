Rails.application.routes.draw do
  root 'posts#index'

#new post
get '/posts/new' => 'posts#new', as: 'new_post'
   post '/posts' => 'posts#create'

#show post
     get '/posts/:id' => 'posts#show' , as: 'post'

#edit post
     get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'
     patch '/posts/:id' => 'posts#update'

#Delete a post
    delete '/posts/:id' => 'posts#destroy'
end