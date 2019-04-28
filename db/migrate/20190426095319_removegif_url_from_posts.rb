class RemovegifUrlFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :gif_url
  end
end