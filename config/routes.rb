Rails.application.routes.draw do
  root "photos#index"
  get "/photos/new" => "photos#new", as: "new_photo"
  post "/photos" => "photos#create"
  get "/photos/:id" => "photos#show", as: "photo"
  get "/photos/:id/edit" => "photos#edit"
  patch "/photos/:id" => "photos#update"
  get "/photos/:id/delete" => "photos#delete"
  delete "/photos/:id" => "photos#destroy"
end
