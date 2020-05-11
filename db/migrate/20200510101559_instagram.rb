class Instagram < ActiveRecord::Migration[5.2]
  def change
    create_table :instagram do |t|
      t.string :title
      t.string :author_name
      t.string :photo_url
      t.timestamps
    end
  end
end