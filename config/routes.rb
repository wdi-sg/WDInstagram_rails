Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :instagrams do
  resources :comments
end

resources :comments

  root 'instagrams#index'

end


