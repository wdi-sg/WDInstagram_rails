class CreateGifs < ActiveRecord::Migration[5.2]
  def change
    create_table :gifs do |t|
      t.string :title
      t.text :author_name
      t.text :gif_url
      t.text :caption

      t.timestamps
    end
  end
end