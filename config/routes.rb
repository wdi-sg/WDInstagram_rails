Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # index (displays all entries)
  root 'instagrams#index'
  # show (displays a specific post)
  # get '/instagrams/:id' => 'instagrams#show' , as: 'instagram'
  # new (displays a form to create a new post)
  get '/instagrams/new' => 'instagrams#new', as: 'new_instagram'
  # create (saves a new post it to the database)
  post '/instagrams' => 'instagrams#create'
  # # edit (displays a form for editing a particular post)
  # get '/instagrams/:id/edit' => 'instagrams#edit', as: 'edit_instagram'
  # # update (takes input from the edit form and updates the post in the db appropriately)
  # patch '/instagrams/:id' => 'instagrams#update'
  # # destroy (deletes a specific post from the database)
  # delete '/instagrams/:id' => 'instagrams#destroy'
end