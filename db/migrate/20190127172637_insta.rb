class Insta < ActiveRecord::Migration[5.2]
  def change
    create_table :insta do |t|
      t.string :title
      t.text :caption
      t.string :pic_url
      t.timestamps
    end
  end
end
