Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'photos#index'
  get '/photos/new' => 'photos#new', as: 'new_photo'
  post '/photos' => 'photos#create'
  get '/photos/:id' => 'photos#show' , as: 'photo'
end

