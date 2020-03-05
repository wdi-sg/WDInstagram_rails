class AddCaptionsToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :title, :string
    add_column :posts, :caption, :text
  end
end
