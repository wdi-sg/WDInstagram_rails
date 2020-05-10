Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  get '/posts/new' => 'layouts#new', as: 'new_post'
  post '/posts' => 'layouts#create'
  get '/posts/:id' => 'layouts#show' , as: 'post'
  get '/posts/:id/edit' => 'layouts#edit', as: 'edit_post'
  patch '/posts/:id' => 'layouts#update'
  delete '/posts/:id' => 'layouts#destroy'
end
