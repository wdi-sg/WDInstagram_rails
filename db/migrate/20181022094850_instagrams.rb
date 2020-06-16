class Instagrams < ActiveRecord::Migration[5.2]
  def change

    create_table :instagrams do |t|
  t.string :username
  t.text :image_url
  t.timestamps
end

  end
end
