class Instagrams < ActiveRecord::Migration[5.2]
  def change
      create_table :instagrams do |t|
        t.text :name
        t.text :category
        t.text :title
        t.text :image_url
        t.text :video_key
        t.text :caption
        t.timestamps
      end
  end
end