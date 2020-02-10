Rails.application.routes.draw do
  root "photos#index"
  get "/photos/new" => "photos#new", as: "new_photo"
  post "/photos" => "photos#create"
  get "/photos/:id" => "photos#show", as: "photo"
end
