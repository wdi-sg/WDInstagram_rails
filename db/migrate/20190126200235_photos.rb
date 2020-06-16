class Photos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
    t.string :author_name
    t.text :photo_url
    t.timestamps
end
  end
end
