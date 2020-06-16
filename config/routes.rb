Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    root 'text#index'
    get '/text/new' => 'text#new', as: 'new_text'
    post '/text' => 'text#create'
    get '/text/:id' => 'text#show' , as: 'text'
    get '/text/:id/edit' => 'text#edit', as: 'edit_text'
    patch '/text/:id' => 'text#update'
    delete '/text/:id' => 'text#destroy'

    get '/post/new' => 'post#new', as: 'new_post'
    post '/post' => 'post#create'
    get '/post/:id' => 'post#show' , as: 'post'
    get '/post/:id/edit' => 'post#edit', as: 'post_text'
    patch '/post/:id' => 'post#update'
    delete '/post/:id' => 'post#destroy'

    get '/photos/new' => 'photos#new', as: 'new_photos'
    post '/photos' => 'photos#create'
    get '/photos/:id' => 'photos#show' , as: 'photos'
    get '/photos/:id/edit' => 'photos#edit', as: 'edit_photos'
    patch '/photos/:id' => 'photos#update'
    delete '/photos/:id' => 'photosw#destroy'

end
