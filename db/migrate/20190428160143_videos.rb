class Videos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :author_name
      t.string :video_url
      t.string :title
      t.string :caption
      t.timestamps
    end
  end
end