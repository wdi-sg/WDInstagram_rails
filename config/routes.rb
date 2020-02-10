Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#index'
  get '/articles/new' => 'articles#new', as: 'new_article'
  post '/articles' => 'articles#create'
  get '/articles/:id' => 'articles#show' , as: 'article'
  get '/articles/:id/edit' => 'articles#edit', as: 'edit_article'
  patch '/articles/:id' => 'articles#update'
  delete '/articles/:id' => 'articles#destroy'
end