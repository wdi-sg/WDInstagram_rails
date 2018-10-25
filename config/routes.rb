Rails.application.routes.draw do

  resources :entries do
    resources :comments
  end

  resources :comments

  resources :tags

  root 'entries#index'
end
