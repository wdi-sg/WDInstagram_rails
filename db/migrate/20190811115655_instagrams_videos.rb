class InstagramsVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :instagram_videos do |t|
      t.text :name
      t.text :video_key
      t.text :title
      t.text :caption
      t.timestamps
    end
  end
end