Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  get '/posts/new' => 'posts#new'
  post '/posts' => 'posts#create'
end


