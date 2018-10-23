Rails.application.routes.draw do
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
	resources :entries do
		resources :comments, :hashtags
	end

	resources :hashtags do
		resources :entries
	end

	root 'entries#index'
end
