class Fixhashtags < ActiveRecord::Migration[5.2]
	def change
		rename_column :entries_hashtags, :entries_id, :entry_id
		rename_column :entries_hashtags, :hashtags_id, :hashtag_id
  end
end
