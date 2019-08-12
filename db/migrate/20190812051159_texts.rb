class Texts < ActiveRecord::Migration[5.2]
  def change
      create_table :texts do |t|
      t.text :author_name
      t.text :text_msg
      t.text :title
      t.text :caption
      t.timestamps
      end
  end
end
