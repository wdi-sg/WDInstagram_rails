Rails.application.routes.draw do
  resources :wdinstagrams

  root'wdinstagrams#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
