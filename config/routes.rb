Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    root 'posts#index'

    get '/posts/new' => 'posts#new', as: 'new_post'

    get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'

    get '/posts/:id' => 'posts#show' , as: 'post'

    post '/posts' => 'posts#create'

    patch '/posts/:id' => 'posts#update'

    delete '/posts/:id' => 'posts#destroy'

end