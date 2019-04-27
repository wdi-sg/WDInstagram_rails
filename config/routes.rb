Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # index (displays all entries)
  root 'wdinsta#index'

   # new (displays a form to create a new post)
  get '/posts/new' => 'wdinsta#new', as: 'new_post'
  post '/posts' => 'wdinsta#create'

  # show (displays a specific post)
  get '/posts/:id' => 'wdinsta#show' , as: 'post'

  # edit (displays a form for editing a particular post)
  get '/posts/:id/edit' => 'wdinsta#edit', as: 'edit_post'
  # update (takes input from the edit form and updates the post in the db appropriately)
  patch '/posts/:id' => 'wdinsta#update'
  
  # destroy (deletes a specific post from the database)
  delete '/posts/:id' => 'wdinsta#destroy'

end
