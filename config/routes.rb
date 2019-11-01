Rails.application.routes.draw do
  root    'instagram#index' 
  get     '/instagram/new'       =>  'instagram#new',     as: 'new_instagram'
  post    '/instagram'           =>  'instagram#create'
  get     '/instagram/:id'       =>  'instagram#show' ,   as: 'instagram'

  # this as: 'edit_instagram' LINKS to the link in the index.html.erb file
  # <td><%= link_to 'Edit', edit_instagram_path(instagram) %></td>
  # edit_instagram_path(instagram) is a FUNCTION being called on instagram
  get     '/instagram/:id/edit'  =>  'instagram#edit',    as: 'edit_instagram'
  patch   '/instagram/:id'       =>  'instagram#update'
  delete  '/instagram/:id'       =>  'instagram#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
