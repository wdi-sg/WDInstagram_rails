class Articles < ActiveRecord::Migration[5.2]
  def change
    t.string :title
    t.text :author_name
    t.text :photo_url
    t.text :caption
    t.timestamps
  end
end