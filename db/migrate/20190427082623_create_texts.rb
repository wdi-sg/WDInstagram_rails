class CreateTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :texts do |t|
      t.text :author_name
      t.text :description
      t.text :title
      t.text :caption
      t.timestamps
    end
  end
end