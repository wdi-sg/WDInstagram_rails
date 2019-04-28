class AddCaptionToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :caption, :text
  end
end
