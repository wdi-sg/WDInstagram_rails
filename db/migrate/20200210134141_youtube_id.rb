class YoutubeId < ActiveRecord::Migration[5.2]
  def change
    rename_column :videos, :video_url, :youtube_id
  end
end
