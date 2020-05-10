Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'instagram#index'

  get '/instagram/new' => 'instagram#new', as: 'new_instagram'

  post '/instagram' => 'instagram#create'

end