Rails.application.routes.draw do

root 'pages#index'
get '/pages/new' => 'pages#new', as: 'new_page'
post '/pages' => 'pages#create'
get '/pages/:id' => 'pages#show', as: 'page'
get '/pages/:id/edit' => 'pages#edit', as: 'edit_page'
patch '/pages/:id' => 'pages#update'
delete '/pages/:id' => 'pages#destroy'
end