Rails.application.routes.draw do

  root 'articles#index'

  resources :articles do
    resources :comments
  end

  resources :articles, :comments

end



