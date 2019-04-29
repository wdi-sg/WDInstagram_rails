class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :author_name
      t.string :photo_url
      t.text :caption

      t.timestamps
    end
  end
end
