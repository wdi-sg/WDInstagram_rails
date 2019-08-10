class Instagrams < ActiveRecord::Migration[5.2]
  def change
    create_table :instagrams do |t|
        t.text :name
        t.text :image_url
        t.text :caption
        t.timestamps
    end
  end
end