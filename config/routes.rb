Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index', as: 'home'
  get '/posts' => 'posts#index', as: 'posts'
  #post '/posts' => 'posts#create'
  get '/posts/new' => 'posts#new', as: 'new_post'
  get '/gifs/search' => 'gifs#search', as: 'search_gif'
  get '/gifs/new' => 'gifs#new', as: 'new_gif'
  get '/videos/new' => 'videos#new', as: 'new_video'
  get '/texts/new' => 'texts#new', as: 'new_text'


  resources :posts
  resources :gifs do
    collection do
      get :search
    end
  end
  resources :videos
  resources :texts
end