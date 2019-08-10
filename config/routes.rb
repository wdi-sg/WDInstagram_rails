Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index', as: 'home'
  get '/posts' => 'posts#index', as: 'posts'
  #post '/posts' => 'posts#create'
  get '/posts/new' => 'posts#new', as: 'new_post'
  #get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'


  resources :posts
end