Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'insta#index'
  get '/insta/new' => 'insta#new', as: 'new_post'
  post '/insta' => 'insta#create'
  get '/insta/:id' => 'insta#show', as: 'single_post'
  get '/insta/:id/edit' => 'insta#edit', as: 'edit_post'
  patch '/insta/:id' => 'insta#update', as: 'update_post'
  delete '/insta/:id' => 'insta#destroy'
end
