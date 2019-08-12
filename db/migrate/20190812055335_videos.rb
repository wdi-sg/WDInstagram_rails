class Videos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :author_name
      t.text :title
      t.text :video_url
      t.text :caption
      t.timestamps
    end
  end
end