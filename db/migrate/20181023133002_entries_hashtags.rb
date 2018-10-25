class EntriesHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :entries_hashtags do |t|
      t.references :entry
      t.references :hashtag
      t.timestamps
    end
  end
end
