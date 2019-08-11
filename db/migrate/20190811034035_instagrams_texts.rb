class InstagramsTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :instagram_texts do |t|
      t.text :name
      t.text :title
      t.text :text
      t.timestamps
    end
  end
end