Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'entries#index'

  get '/entries/new' => 'entries#new', as: 'new_entry'
  post '/entries' => 'entries#create'

  get '/entries/:id' => 'entries#show' , as: 'entry'

  get '/entries/:id/edit' => 'entries#edit', as: 'edit_entry'
  patch '/entries/:id' => 'entries#update'

  delete '/entries/:id' => 'entries#destroy'

end