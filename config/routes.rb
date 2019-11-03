Rails.application.routes.draw do
  get 'posts/index'
  root    'posts#index' 
  get     '/posts'           => 'posts#index'
  get     '/posts/new'       =>  'posts#new',     as: 'new_post'
  post    '/posts'           =>  'posts#create'
  get     '/posts/:id'       =>  'posts#show' ,   as: 'post'

  # this as: 'edit_post' LINKS to the link in the index.html.erb file
  # <td><%= link_to 'Edit', edit_post_path(post) %></td>
  # edit_post_path(post) is a FUNCTION being called on post
  get     '/posts/:id/edit'  =>  'posts#edit',    as: 'edit_post'
  patch   '/posts/:id'       =>  'posts#update'
  delete  '/posts/:id'       =>  'posts#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
