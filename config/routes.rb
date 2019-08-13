Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

  root 'articles#index'
  get '/articles' => 'articles#index', as: 'articles'
  get '/articles/new' => 'articles#new', as: 'new_post'
  get '/articles/:id' => 'articles#show', as: 'post'
  get '/articles/:id/edit' => 'articles#edit', as: 'edit_post'

  post '/articles' => 'articles#create'
  delete '/articles/:id' => 'articles#destroy', as: 'destroy_post'