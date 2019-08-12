Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'posts#index'
    get '/posts/sort/:conds/:order' => 'posts#sort', as: 'sort_post'
    get '/posts/new' => 'posts#new', as: 'new_post'
    post '/posts' => 'posts#create'
    get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'
    get '/posts/:id' => 'posts#show' , as: 'post'
    patch '/posts/:id' => 'posts#update'
    delete '/posts/:id' => 'posts#destroy'

    get '/videos' => 'videos#all', as: 'all_videos'
    get '/videos/sort/:conds/:order' => 'videos#sort', as: 'sort_video'
    get '/videos/new' => 'videos#new', as: 'new_video'
    post '/videos' => 'videos#create'
    get '/videos/:id/edit' => 'videos#edit', as: 'edit_video'
    get '/videos/:id' => 'videos#show' , as: 'video'
    patch '/videos/:id' => 'videos#update'
    delete '/videos/:id' => 'videos#destroy'

end
