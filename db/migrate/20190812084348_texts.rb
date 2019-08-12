class Texts < ActiveRecord::Migration[5.2]
  def change
    create_table :texts do |t|
      t.string :author_name
      t.text :title
      t.text :caption
      t.timestamps
    end
  end
end