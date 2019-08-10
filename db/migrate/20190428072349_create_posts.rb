class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :photo_url
      t.text :author_name
      t.string :caption
      t.timestamps
    end
  end
end
