Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # index (displays all entries)
  root 'posts#index'
  # new (displays a form to create a new post)
  get '/posts/new' => 'posts#new', as: 'new_post'
  # show (displays a specific post)
  get '/posts/:id' => 'posts#show' , as: 'post'

  # create (saves a new post it to the database)
  post '/posts' => 'posts#create'
  # edit (displays a form for editing a particular post)
  get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'
  # update (takes input from the edit form and updates the post in the db appropriately)
  patch '/posts/:id' => 'posts#update'
  # destroy (deletes a specific post from the database)
  delete '/posts/:id' => 'posts#destroy'
end