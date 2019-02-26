Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get '/new' => 'pages#new', as: 'new_page'
  post '/new' => 'pages#create'
end
