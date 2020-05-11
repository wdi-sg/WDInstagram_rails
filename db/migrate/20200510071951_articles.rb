class Articles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.image :image
      t.text :text
      t.timestamps
    end
  end
end
