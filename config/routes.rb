Rails.application.routes.draw do

    get '/posts/new' => 'posts#new', as: 'new_post'

    post '/posts' => 'posts#create'

    get '/posts/:id' => 'posts#show' , as: 'post'

    get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'

    patch '/posts/:id' => 'posts#update'

    delete '/posts/:id' => 'posts#destroy'

    root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
