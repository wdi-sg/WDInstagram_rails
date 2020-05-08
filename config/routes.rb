Rails.application.routes.draw do
  root "photos#index"
  get "/photos/new" => "photos#new", as: "new_photo"
  post "/photos" => "photos#create"
  get "/photos/:id" => "photos#show", as: "photo"
  get "/photos/:id/edit" => "photos#edit", as: "edit"
  patch "/photos/:id" => "photos#update"
  get "/photos/:id/delete" => "photos#delete"
  delete "/photos/:id" => "photos#destroy"

  get "/videos" => "videos#show"
  get "/videos/new" => "videos#new", as: "new_video"
  post "/videos" => "videos#create"
  get "/videos/:id" => "videos#show", as: "video"
  get "/videos/:id/delete" => "videos#delete", as: "delete_video"
  delete "/videos/:id" => "videos#destroy"
  get "/videos/:id/edit" => "videos#edit", as: "edit_video"
  patch "/videos/:id" => "videos#update"
end
