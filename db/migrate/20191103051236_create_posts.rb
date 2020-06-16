#after I generated the model  Posts, in this migration file I created the table for the posts
#it has columns for author_name, photo_url, title and rails timestamp, all data stored as text
class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.author_name
      t.photo_url
      t.title
      t.timestamps
    end
  end
end