class Hashtags < ActiveRecord::Migration[5.2]
	def change
		create_table :hashtags do |t|
			t.string :content
			t.timestamps
		end
		create_table :entries_hashtags do |t|
			t.references :entries
			t.references :hashtags
			t.timestamps
		end
  end
end
