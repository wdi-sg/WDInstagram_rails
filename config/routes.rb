Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'

  #create (create info from new into db)
  post '/posts' => 'posts#create'
  #create form
  get '/posts/new' => 'posts#new', as: 'new_post'

  get '/posts/sort' => 'posts#sortIndex'
  #show single
  get '/posts/:id' => 'posts#show', as: 'post'
  #update (edited info into db), no html.erb
  patch '/posts/:id' => 'posts#update'
  #edit
  get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'
  #delete, no html.erb
  delete '/posts/:id' => 'posts#destroy'




end