class AddCommentsToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :comments, :string
  end
end
