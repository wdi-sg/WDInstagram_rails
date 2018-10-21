class Post < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :author
      t.text :photo_url
      t.text :caption
      t.date :date_taken
      t.timestamps
    end
  end
end
