class HashtagsPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtags_photos do |t|
      t.references :hashtag
      t.references :photo
      t.timestamps
    end
  end
end
