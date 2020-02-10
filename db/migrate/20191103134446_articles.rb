class Articles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
  t.string :name
  t.text :photo_url
  t.string :title
  t.timestamps
end
  end
end