Rails.application.routes.draw do
  root 'instagram#index'
  get '/instagram/new' => 'instagram#new', as: 'new_post'
  post '/instagram' => 'instagram#create'
  get '/instagram/:id' => 'instagram#show', as: 'post'
  get '/instagram/:id/edit' => 'instagram#edit', as: 'edit_post'
  patch '/instagram/:id' => 'instagram#update'
  delete '/instagram/:id' => 'instagram#destroy'
end