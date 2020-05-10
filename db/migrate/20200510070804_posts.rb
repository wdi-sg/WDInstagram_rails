class Posts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :author
      t.text :photo_url
      t.text :text
      t.timestamps
    end
  end
end
