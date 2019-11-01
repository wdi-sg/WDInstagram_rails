class Articles < ActiveRecord::Migration[5.2]
  def change
    create_table :instagram do |t|
      t.string :author_name
      t.text :title
      t.text :photo_url
      t.timestamps
    end
  end

end
