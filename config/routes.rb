Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
    resources :comments
    resources :hashtags
  end

  resources :hashtags do
    resources :posts do
      resources :comments
    end
  end

  root 'posts#index'
end
