class Entries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :author
      t.text :photo_url
      t.date :date_taken
      t.timestamps
    end
  end
end
