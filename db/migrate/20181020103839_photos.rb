class Photos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :author
      t.string :photo_url
      t.text :caption
      t.timestamps
    end
  end
end
