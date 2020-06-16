class Articles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :author_name
      t.text :photo_url
      t.text :title
      t.timestamps
    end
  end
end