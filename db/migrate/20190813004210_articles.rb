class Articles < ActiveRecord::Migration[5.2]
  def change
    # Here it uses the create_table method to create a new table in the database
  create_table :posts do |t|
      # String column called author_name in the table
    t.string :author_name
    t.string :photo_url
    t.string :title
    t.timestamps
  end
end