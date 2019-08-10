class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.text :title
      t.text :video_url
      t.text :author_name
      t.text :caption

      t.timestamps
    end
  end
end
