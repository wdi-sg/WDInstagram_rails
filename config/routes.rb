Rails.application.routes.draw do

  resources :posts # creates seven different routes in your application
  
  get 'posts/index'

  root 'posts#index'
end
