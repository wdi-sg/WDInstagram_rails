Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
        root 'posts#index'

        # CREATE (C)
        get '/posts/new' => 'posts#new', as: 'new_post'
        post '/posts' => 'posts#create'

        # READ (R)
        get '/posts/:id' => 'posts#show' , as: 'post'

        # UPDATE (U)
        get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'
        patch '/posts/:id' => 'posts#update'

        # DELETE (D)
        delete '/posts/:id' => 'posts#destroy'

      end