Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/posts/new" => "posts#new", as: "new_post"
  post "/posts" => "posts#create"
  # get "/posts/:id" => "posts#show", as: "posts"

  root "posts#index"
end
