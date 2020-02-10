json.extract! post, :id, :author_name, :photo_url, :title, :caption, :created_at, :updated_at
json.url post_url(post, format: :json)
