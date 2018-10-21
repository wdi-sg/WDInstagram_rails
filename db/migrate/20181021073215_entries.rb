class Entries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :author
      t.string :photo_url
      t.string :date_taken
      t.timestamps
    end
  end
end
