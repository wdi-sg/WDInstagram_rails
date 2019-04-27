Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Not needed? Mentioned by Shan
  root 'posts#index'

  # ROUTES..
  # I am assuming 'posts#new' refers to new.html.erb?
  # As for as: 'new_post'(?)
  get '/posts/new' => 'posts#new', as: 'new_post'
  # Goes to create 'func' in posts_controller.rb
  post '/posts' => 'posts#create'

  get '/posts/:id' => 'posts#show' , as: 'post'

  get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'
  # Instead of app.put we get patch
  patch '/posts/:id' => 'posts#update'

  delete '/posts/:id' => 'posts#destroy'
end