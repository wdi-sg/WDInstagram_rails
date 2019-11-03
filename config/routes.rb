#after generating controller for the posts, and adding methods for the RESTful routes actions there,
#I create the routes in this file
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


#root route for "posts#index" controller's action, path => /posts , HTTP verb => GET, used to display all posts
  root 'posts#index'
#a route for "posts#new" controller's action, path => /posts/new , HTTP verb => GET, used to display form for creating new post
  get '/posts/new' => 'posts#new', as: 'new_post'
#a route for "posts#create" controller's action, path => /posts, HTTP verb => POST, used to create a new post
  post '/posts' => 'posts#create'
#a route for "posts#show" controller's action, path => /posts/:id , HTTP verb => GET, used to display a specific post
  get '/posts/:id' => 'posts#show' , as: 'post'
#a route for "posts#edit" controller's action, path => /posts/:id/edit , HTTP verb => GET, used to display form for editing a post
  get '/posts/:id/edit' => 'posys#edit', as: 'edit_post'
#a route for "posts#update" controller's action, path => /posts/:id , HTTP verb => PATCH, used to update a specific post
  patch '/posts/:id' => 'posts#update'
#a route for "posts#destroy" controller's action, path => /posts/:id , HTTP verb => DELETE, used to delete a specific post
  delete '/posts/:id' => 'posts#destroy'


end