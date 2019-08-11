Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  resources :videos
  root "all#index"
  get '/sortpost' => "sorts#sortpost"
  get '/sortvideo' => "sorts#sortvideo"
  get '/sortall' => "sorts#sortall"
  post '/randomgif' => "posts#randomgif"
end
