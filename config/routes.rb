Rails.application.routes.draw do
  root 'posts#index'
  get '/posts/new' => 'posts#new', as: 'new_post'
  post '/posts' => 'posts#create'
end