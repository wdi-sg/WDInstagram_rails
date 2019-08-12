Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # You can have the root of your site routed with "root"
root 'posts#index', as: 'home'

  # Example of regular route:
get 'show' => 'pages#show', as: 'show'

  # Example of 'resource'
resources :posts


end
