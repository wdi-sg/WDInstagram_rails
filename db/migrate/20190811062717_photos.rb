class Photos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :title
      t.string :author
      t.text :pic
      t.text :caption
      t.timestamps
    end
  end
end