class CreateTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :texts do |t|
      t.text :author_name
      t.text :text

      t.timestamps
    end
  end
end
