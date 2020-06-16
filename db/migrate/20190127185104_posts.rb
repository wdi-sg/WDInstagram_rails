class Posts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :photo_url
      t.text :author_name
      t.text :caption
      t.timestamps
    end
  end
end
