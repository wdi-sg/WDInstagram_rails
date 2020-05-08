Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'profiles#index'
  get '/profiles/new' => 'profiles#new', as: 'new_profile'
  post '/profiles' => 'profiles#create'
  get '/profiles/:id' => 'profiles#show' , as: 'profile'
end