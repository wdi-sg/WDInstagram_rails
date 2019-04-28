class AddGifUrlToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :gif_url, :text
  end
end
