class Photos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.text :author_name
      t.text :photo_url
      t.text :title
    end
  end
end
