class HashtagsPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtags_posts do |t|
      t.references :hashtag
      t.references :post
      t.timestamps
    end
  end
end
