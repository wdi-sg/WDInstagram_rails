class Photos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |table|
      table.string :author
      table.string :photo_url
      table.string :date_taken
    end
  end
end
