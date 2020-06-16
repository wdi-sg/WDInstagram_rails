Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'mains#index'

  get '/mains/new' => 'mains#new', as: 'new_post'
  
end
