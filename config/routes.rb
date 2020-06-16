Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :entries
  root 'entries#index'
  
  # get "entries" => 'entries#index'
  # get "entries/new" => 'entries#new'
  # get "entries/:id/edit" => 'entries#edit'
  # get "entries/:id" => 'entries#show'
  # post "entries" => 'entries#create'
  # put "entries/:id" => 'entries#update'
  # delete "entries/:id" =>'entries#destroy'
end
