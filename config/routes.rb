Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :articles

    root 'articles#index'

    resources :articles do
      resources :comments
    end

  resources :comments


  resources :articles do
    resources :hashtags
  end

  resources :hashtags do
    resources :articles
  end

end
