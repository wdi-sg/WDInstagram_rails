Rails.application.routes.draw do

  resources :entries do
    resources :comments
  end

  resources :comments

  root 'entries#index'
end
