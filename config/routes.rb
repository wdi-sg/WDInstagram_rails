Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :entries do
    resources :comments
    resources :tags
  end 

  resources :tags do
    resources :entries
  end
  # resources :comments
  root 'entries#index'
end
