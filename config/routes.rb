Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :photos do
  resources :comments
end

resources :comments

root 'photos#index'
# get '/photos', to:'photo#index'

end
