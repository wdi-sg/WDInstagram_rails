class PhotosHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :photos_hashtags do |t|
      t.references :photo
      t.references :hashtag
      t.timestamps
    end
  end
end
